
resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc2.id
   health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group" "test1" {
  name     = "tf-example-lb-tg1"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc2.id
   health_check {
    path                = "/login"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.test.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:699475925558:certificate/61f37e2c-9205-4c82-be9c-380bd775c479"

  default_action {
    type = "forward"
   forward {
      target_group {
        arn = aws_lb_target_group.test.arn
        
      }
    }
  }
}
resource "aws_lb_listener" "httpss" {
  load_balancer_arn = aws_lb.test.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:699475925558:certificate/61f37e2c-9205-4c82-be9c-380bd775c479"

  default_action {
    type = "forward"
   forward {
      target_group {
        arn = aws_lb_target_group.test1.arn
      }
    }
  }
}
