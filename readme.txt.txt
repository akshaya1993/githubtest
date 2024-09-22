C:\Users\admin\Desktop\PROJECT1>ssh-keygen -t rsa -C "id-rsa" -f C:/Users/admin/Desktop/PROJECT1/id_rsa
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in C:/Users/admin/Desktop/PROJECT1/id_rsa.
Your public key has been saved in C:/Users/admin/Desktop/PROJECT1/id_rsa.pub.
The key fingerprint is:
SHA256:jmorfEdkk6busS8g91EYj/PJGyQ+56r/k46YC2ffO/o id-rsa
The key's randomart image is:
+---[RSA 3072]----+
|                 |
|    .            |
|     = .         |
|    = X          |
|   . % oS        |
|. o = Bo         |
|.+o+.*.+.        |
| +o+**B          |
|  =O@@E+         |
+----[SHA256]-----+

C:\Users\admin\Desktop\PROJECT1>aws ec2 import-key-pair --key-name "id_rsa" --public-key-material fileb://C:/Users/admin/Desktop/PROJECT1/id_rsa.pub
{
    "KeyFingerprint": "60:46:88:3e:9d:ea:54:8c:47:b1:6f:9d:55:7e:e8:2d",
    "KeyName": "id_rsa",
    "KeyPairId": "key-037b56af02aef81f1"
}