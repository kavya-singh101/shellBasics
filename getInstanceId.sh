aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceId, "State Name": .State.Name}'
