Docker
======

Multilpe docker images 

Image layers
======

<img src="https://dl.dropboxusercontent.com/s/7u6fw9ytl6kxdiu/image_layers.png" title="Image layers" />

Dependencies
======

- Installed docker 0.6.6 ->
- shyaml shell yaml parser (pip install shyaml)

WordPress
======

To build WordPress docker images run:
```
./env.sh build wp
```

To start WordPress:
```
./env.sh start wp
```

Your WordPress installation will be available at http://localhost:80
