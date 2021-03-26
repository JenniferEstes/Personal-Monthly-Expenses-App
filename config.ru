require_relative './config/environment'

use Rack::MethodOverride
use Rack::Session::Cookie
use SessionsController
use ExpensesController

run ApplicationController