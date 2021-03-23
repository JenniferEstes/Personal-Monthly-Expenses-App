require_relative './config/environment'

use Rack::MethodOverride
use Rack::Session::Cookie
use SessionsController

run ApplicationController