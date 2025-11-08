# AWS S3 Demo Project

**Objective:**  
Configured S3 buckets with lifecycle policies, storage classes, and permissions for cost optimization.

**Features Implemented:**  
- Bucket versioning enabled  
- Lifecycle policies to move files from Standard → Standard-IA → Glacier  
- Public/private bucket configuration  
- Sample files uploaded for demonstration  

**Technologies Used:**  
- AWS S3 (Learner Lab)  

- JSON policies

**Sample Lifecycle Policy:**
```json
{
  "Rules": [
    {
      "ID": "MoveToIA",
      "Prefix": "",
      "Status": "Enabled",
      "Transitions": [
        {
          "Days": 30,
          "StorageClass": "STANDARD_IA"
        },
        {
          "Days": 60,
          "StorageClass": "GLACIER"
        }
      ],
      "Expiration": {
        "Days": 365
      }
    }
  ]
}
