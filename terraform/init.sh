export YC_TOKEN=$(yc iam create-token --impersonate-service-account-id ajes212h74rqsh6g1m30)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)