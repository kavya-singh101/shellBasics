set -x
set -e

aws s3 ls >> s3list.txt

date >> instanceIds.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceId, LaunchTime, "State Name": .State.Name}' >> instanceIds.txt

aws lambda list-functions >> lambdaList.txt

aws iam list-users >> iamList.txt

