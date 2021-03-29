require_relative './config/environment'

use Rack::MethodOverride
use SessionsController
use ExpensesController
use UsersController

run ApplicationController