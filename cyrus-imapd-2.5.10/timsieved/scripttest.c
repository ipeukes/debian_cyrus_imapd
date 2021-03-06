/* scripttest.c -- test wheather the sieve script is valid
 * Tim Martin
 *
 * Copyright (c) 1994-2008 Carnegie Mellon University.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The name "Carnegie Mellon University" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For permission or any legal
 *    details, please contact
 *      Carnegie Mellon University
 *      Center for Technology Transfer and Enterprise Creation
 *      4615 Forbes Avenue
 *      Suite 302
 *      Pittsburgh, PA  15213
 *      (412) 268-7393, fax: (412) 268-7395
 *      innovation@andrew.cmu.edu
 *
 * 4. Redistributions of any form whatsoever must retain the following
 *    acknowledgment:
 *    "This product includes software developed by Computing Services
 *     at Carnegie Mellon University (http://www.cmu.edu/computing/)."
 *
 * CARNEGIE MELLON UNIVERSITY DISCLAIMS ALL WARRANTIES WITH REGARD TO
 * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS, IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY BE LIABLE
 * FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
 * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
 * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

#include "assert.h"
#include "util.h"
#include "xmalloc.h"

#include "timsieved/codes.h"
#include "timsieved/scripttest.h"

/* to make larry's stupid functions happy :) */ 
static void foo(void)
{
    fatal("stub function called", 0);
}


static sieve_vacation_t vacation = {
    0,				/* min response */
    0,				/* max response */
    (sieve_callback *) &foo,	/* autorespond() */
    (sieve_callback *) &foo	/* send_response() */
};

static int sieve_notify(void *ac __attribute__((unused)), 
			void *interp_context __attribute__((unused)), 
			void *script_context __attribute__((unused)),
			void *message_context __attribute__((unused)),
			const char **errmsg __attribute__((unused)))
{
    fatal("stub function called", 0);
    return SIEVE_FAIL;
}

static int mysieve_error(int lineno, const char *msg,
		  void *i __attribute__((unused)), void *s)
{
    struct buf *errors = (struct buf *)s;
    buf_printf(errors, "line %d: %s\r\n", lineno, msg);
    return SIEVE_OK;
}

/* returns TRUE or FALSE */
int build_sieve_interp(void)
{
    int res;

    interp = sieve_interp_alloc(NULL);
    assert(interp != NULL);

    sieve_register_redirect(interp, (sieve_callback *) &foo);
    sieve_register_discard(interp, (sieve_callback *) &foo);
    sieve_register_reject(interp, (sieve_callback *) &foo);
    sieve_register_fileinto(interp, (sieve_callback *) &foo);
    sieve_register_keep(interp, (sieve_callback *) &foo);
    sieve_register_imapflags(interp, NULL);
    sieve_register_size(interp, (sieve_get_size *) &foo);
    sieve_register_header(interp, (sieve_get_header *) &foo);
    sieve_register_envelope(interp, (sieve_get_envelope *) &foo);
    sieve_register_body(interp, (sieve_get_body *) &foo);
    sieve_register_include(interp, (sieve_get_include *) &foo);

    res = sieve_register_vacation(interp, &vacation);
    if (res != SIEVE_OK) {
	syslog(LOG_ERR, "sieve_register_vacation() returns %d\n", res);
	return TIMSIEVE_FAIL;
    }

    sieve_register_notify(interp, &sieve_notify);
    sieve_register_parse_error(interp, &mysieve_error);

    return TIMSIEVE_OK;
}

/* returns TRUE or FALSE */
int is_script_parsable(FILE *stream, char **errstr, sieve_script_t **ret)
{
    sieve_script_t *s;
    int res;
    struct buf errors = BUF_INITIALIZER;

    rewind(stream);

    buf_appendcstr(&errors, "script errors:\r\n");
    *errstr = NULL;

    res = sieve_script_parse(interp, stream, &errors, &s);

    if (res == SIEVE_OK) {
	if(ret) {
	    *ret = s;
	} else {
	    sieve_script_free(&s);
	}
    }
    else {
	sieve_script_free(&s);
	*errstr = buf_release(&errors);
    }
    buf_free(&errors);
    return (res == SIEVE_OK) ? TIMSIEVE_OK : TIMSIEVE_FAIL;
}
