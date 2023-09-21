resource "aws_iam_instance_profile" "vpc_flog_logs_profile" {
    name = "vpc-flow-logs-instance-profile"
    role = "${aws_iam_role.vpc_flow_logs_role.name}"
}

resource "aws_instance" "instance" {
    ami = "${var.ami_id}" 
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = ["${aws_security_group.ssh_http_sg.id}"]
    subnet_id     = "${aws_subnet.subnet.id}"
    associate_public_ip_address = true
    iam_instance_profile = "${aws_iam_instance_profile.vpc_flog_logs_profile.name}"
    user_data = "${file("user-data.sh")}"
    depends_on = [aws_security_group.ssh_http_sg]
}

