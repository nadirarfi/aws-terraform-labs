resource "aws_lb_target_group" "target-group"{
    name = "my-target-instances"
    port = 80
    protocol = "HTTP"
    vpc_id = data.aws_vpc.default.id
    target_type =  "instance"

    health_check  {
        interval            = 10
        path                = "/"
        protocol            = "HTTP"
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2     
    }
}

resource "aws_lb_target_group_attachment" "ec2_attach" {
    count = length(aws_instance.instances)
    target_group_arn = aws_lb_target_group.target-group.arn
    target_id        = aws_instance.instances[count.index].id
}	