#
# Cookbook Name:: app
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Seems like nokogiri and rmagick are pretty common Rails
# dependencies. Might as well get those out of the way.
include_recipe "xml"
include_recipe "xslt"
include_recipe "imagemagick"

# Apparently Rails 3.1 requires a JavaScript interpreter for execjs
# and node is the most convenient to install.
include_recipe "app::node"

include_recipe "app::database"
include_recipe "app::nginx"
include_recipe "app::unicorn"
include_recipe "app::bluepill"
