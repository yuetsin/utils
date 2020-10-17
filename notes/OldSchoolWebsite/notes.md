# Old School Website

> 建议使用IE6、1024*768以下分辨率浏览！

居然还接入了 jAccount 接口。

众所周知，jAccount 接口会返回一大堆数据，包括我的名字和学号。当然都是加密过的，每个应用都有独立的密钥。

> 如果能找 NIC 把我的学号改成 `19260817`，那应该就可以成功看到 Flag 了吧。

或者，直接 Crack 掉加密演算法，截获传回网站的数据包（就是 `jatkt` 那一堆），并且篡改其中的内容（冒充易赛挺会长），应该也可以实现。

那么 jAccount 登录协议具体是怎样的呢？在[这个项目](https://github.com/SweenEy1130/MobileCheckIn/blob/master/admin.py)里可以查到：

```python

def keydata():
	f_path = sys.path[0]+"/conf/jasignin20130507_desede.key"
	f = open(f_path,'rb')
	f_data = f.read()
	f.close()
	return f_data

def encrypt(data,iv):
	key = keydata()
	k = triple_des(key,CBC,iv,pad=None,padmode=PAD_PKCS5)
	d = k.encrypt(data)
	data = chr(8)+iv+d
	data = urllib2.quote(base64.b64encode(data))
	return data

def decrypt(data,iv):
	key = keydata()
	try:
		data = base64.b64decode(urllib2.unquote(data))
		data = data[1:]
		d = triple_des(key,CBC,iv,pad=None,padmode=PAD_PKCS5)
		k = d.decrypt(data)
	except TypeError,ValueError:
		raise HTTPError(404)
	return k
```

![image-20201016094052806](notes.assets/image-20201016094052806.png)

> 这家伙居然把密钥也传上来了…

但是每个项目有独立的密钥，这个肯定不能拿来直接用。

jAccount 的 jaLogin 模块返回数据後，会通过 `http://111.186.57.85:30060/jaccount?jatkt=???????` 交给服务器鉴权。如果我们能够伪造会长的 `jatkt`，发到这里，问题就解决了。

> 但是，我没有你的 key，也不知道该怎么猜测 `iv`。

![image-20201016095930795](notes.assets/image-20201016095930795.png)

> 你在嘲笑我吗？？？

