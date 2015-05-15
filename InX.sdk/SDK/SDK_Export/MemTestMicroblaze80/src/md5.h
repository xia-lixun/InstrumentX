/*
 * md5.h
 *
 *  Created on: 2015-5-15
 *      Author: lixun
 */

#ifndef MD5_H_
#define MD5_H_


  /*
   * This is an OpenSSL-compatible implementation of the RSA Data Security,
   * Inc. MD5 Message-Digest Algorithm.
   *
   * Written by Solar Designer <solar@openwall.com> in 2001, and placed in
   * the public domain.  See md5.c for more information.
   */


  /* Any 32-bit or wider unsigned integer data type will do */
  typedef unsigned long MD5_u32plus;

  typedef struct {
          MD5_u32plus lo, hi;
          MD5_u32plus a, b, c, d;
          unsigned char buffer[64];
          MD5_u32plus block[16];
  } MD5_CTX;

  extern void MD5_Init(MD5_CTX *ctx);
  extern void MD5_Update(MD5_CTX *ctx, void *data, unsigned long size);
  extern void MD5_Final(unsigned char *result, MD5_CTX *ctx);



#endif /* MD5_H_ */