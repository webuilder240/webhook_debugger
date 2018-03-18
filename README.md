# Docker Image
[https://hub.docker.com/r/webuilder240/webhook_debugger/]

# WebAPI (Heroku)
[https://safe-inlet-51629.herokuapp.com/]

# How to Use (WebAPI)

```
  curl https://safe-inlet-51629.herokuapp.com?hoge=fuga | jq
  {
      "path": "/",
      "request_method": "GET",
      "hoge": "fuga"
  }
```

# How to Use (Ruby)

## Requirements
- Ruby 2.x
- bundler

```
bundle install
bundle exec rackup

curl https://localhost:9292?hoge=fuga | jq
{
    "path": "/",
    "request_method": "GET",
    "hoge": "fuga",
    "status_code": 200
}
```

# Docker

```
docker run -p 9292:9292 webuilder240/webhook_debugger
curl http://localhost:9292?hoge=fuga | jq
{
    "path": "/",
    "request_method": "GET",
    "hoge": "fuga",
    "status_code": 200
}
```

# Endpoints

## [GET|POST|PUT|PATCH|OPTIONS] *

### Paramaters
|name|required|type|Description|
|:---|:---|:---|:---|
|response_time|False|Integer|Wait a ResponseTime (ms)|
|response_status_code|False|Integer|Response HTTP Status Code|

### Response

```
  curl https://safe-inlet-51629.herokuapp.com?hoge=fuga | jq
  {
      "path": "/",
      "request_method": "GET",
      "hoge": "fuga",
      "status_code": 200
  }
```

```
  curl -XPOST https://safe-inlet-51629.herokuapp.com/hoge/fuga?response_time=1000&response_status_code=401 | jq
  {
      "path": "/hoge/fuga",
      "response_time": 1000,
      "response_status_code": 401,
      "request_method": "GET",
      "hoge": "fuga",
      "status_code": 200
  }
```
