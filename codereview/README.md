# Challenge

This challenge migh look like a crypto challenge but *appearances might be deceiving*. 

The code below takes and input and prints a ciphertext but to solve the challenge you need to understand what it really does. 

I run the code *only once* to encrypt the flag of this challenge and it printed `806a85ecd00bc75f4bff3a54927b6214f1e0e3e3243511430c89533bf175bdf807c4a0014d658861e45f0ba692448511`. 

Can you recover the flag?

```go
package main

import (
	"bytes"
	"crypto/aes"
	"crypto/cipher"
	"encoding/hex"
	"fmt"
	"strings"
	"time"
)

func main() {

	var p string = ""
	fmt.Scanln(&p)
	iv := "0000000000000000"
	bp := PKCS5Padding([]byte(p), aes.BlockSize, len(p))

	t := time.Now().String()

	var k strings.Builder
	for i:=0; i<8; i++ { k.WriteString(t[14:16]) }

	ac, _ := aes.NewCipher([]byte(k.String()))
	c := make([]byte, len(bp))
	mode := cipher.NewCBCEncrypter(ac, []byte(iv))
	mode.CryptBlocks(c, bp)

	fmt.Println(hex.EncodeToString(c))
}

func PKCS5Padding(c []byte, bs int, after int) []byte {
	pa := (bs - len(c)%bs)
	pt := bytes.Repeat([]byte{byte(pa)}, pa)
	return append(c, pt...)
}
```