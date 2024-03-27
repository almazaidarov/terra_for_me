output id {
    description = "Provides information about instance ID"
    value = aws_instance.web.id
}

output arn {
    description = "Provides information about instance ARN"
    value = aws_instance.web.arn
}

output public_ip {
    description = "Provides information about instance public_ip"
    value = aws_instance.web.public_ip
}