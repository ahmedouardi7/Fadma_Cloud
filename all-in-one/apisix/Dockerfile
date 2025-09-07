#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cat << EOF > $(pwd)/config.yaml
deployment:
  role: traditional
  role_traditional:
    config_provider: etcd
  admin:
    allow_admin:
      - 0.0.0.0/0  # Please set it to the subnet address you obtained.
                  # If not set, by default all IP access is allowed.
  etcd:
    host:
      - "http://etcd:2379"
    prefix: "/apisix"
    timeout: 30
EOF




docker exec -i apache-apisix sh -c 'cat > /usr/local/apisix/conf/apisix.yaml <<_EOC_
routes:
  -
    id: httpbin
    uri: /*
    upstream:
      nodes:
        "httpbin.org": 1
      type: roundrobin
    plugin_config_id: 1

plugin_configs:
  -
    id: 1
    plugins:
      response-rewrite:
        body: "Hello APISIX\n"
    desc: "response-rewrite"
#END
_EOC_'

