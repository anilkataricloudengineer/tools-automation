module "create-secrets" {
  for_each = var.secrets
  source = "./create-secrets"
  kv_path = each.key
  secrets = each.value
}

variable "secrets" {
  default = {
    infra = {
      ssh = {
        admin_username = "roboshop-ansible",
        admin_password = "Devops123456"
      }
    }
    roboshop-dev = {
      frontend = {
        catalogue_endpoint = "http://catalogue-dev.anilcloudengineer.online:8080"
        cart_endpoint = "http://cart-dev.anilcloudengineer.online:8080"
        user_endpoint = "http://user-dev.anilcloudengineer.online:8080"
        payment_endpoint = "http://payment-dev.anilcloudengineer.online:8080"
        shipping_endpoint = "http://shipping-dev.anilcloudengineer.online:8080"
      }
      catalogue = {
        MONGO = "true"
        MONGO_URL = "mongodb://mongodb-dev.anilcloudengineer.online:27017/catalogue"
      }
      user = {
        MONGO     = "true"
        REDIS_URL = "redis://redis-dev.anilcloudengineer.online:6379"
        MONGO_URL = "mongodb://mongodb-dev.anilcloudengineer.online:27017/users"
      }
      cart = {
        REDIS_HOST = "redis-dev.anilcloudengineer.online"
        CATALOGUE_HOST = "catalogue-dev.anilcloudengineer.online"
        CATALOGUE_PORT = "8080"
      }
      shipping = {
        CART_ENDPOINT = "cart-dev.anilcloudengineer.online:8080"
        DB_HOST = "mysql-dev.anilcloudengineer.online"
      }
      payment = {
       CART_HOST = "cart-dev.anilcloudengineer.online"
       CART_PORT = "8080"
        USER_HOST = "user-dev.anilcloudengineer.online"
        USER_PORT = "8080"
        AMQP_HOST = "rabbitmq-dev.anilcloudengineer.online"
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
      }
      mysql = {
        MYSQL_ROOT_PASSWORD = "RoboShop@1"

      }
      rabbitmq = {
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
      }
    }
  }
}