### Sensu monitroing tests
---

This set of serverspec tests includes tests for:
* sensu
* rabbitmq
* redis
* keepalived
* graphite
* nginx


#### install serverspec
```
sudo bundle
```


#### Run the tests

#####optional environment variables:

* SSH_USER - set default user rake will use for ssh
* SPEC_STRATEGY - set fail to stop execution on first failed host
* PROP_FILE - define properties file name (default properties.yml)

```
export SSH_USER=<user_name>
export SPEC_STRATEGY="fail"
export PROP_FILE="properties.yml"
```

##### Run tests

```
rake spec
```



#### properties.yml file example
```
graphite1.example.org:                                                                                                                                                                                                                                                          
  :roles:
  - graphite
sensu1.example.org:
  :roles:
  - redis
  - rabbitmq
  - sensu
lb1.example.org:
  :roles:
  - haproxy
  - keepalived
```


Structure:
```
domain.name
  :roles:
    - <spec_role_name>
```
