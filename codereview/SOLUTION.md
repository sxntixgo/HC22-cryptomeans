# Intended solution

This code generates the key by getting the computer time and using the minutes eight times as the key of an AES cipher. So to solve the challenge there are "only" 60 possible keys, and you know the IV and the ciphertext. This can be solved manually in [Cyberchef](https://gchq.github.io/CyberChef/).