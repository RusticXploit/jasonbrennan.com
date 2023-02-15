#!/bin/bash
apikey=

curl -s "https://jellyfin.jasonbrennan.com/Users/26b9f9c9483d4cce957c03bf6e9c257f/Items?SortBy=SortName%2CProductionYear&SortOrder=Ascending&IncludeItemTypes=Movie&Recursive=true&Fields=PrimaryImageAspectRatio%2CMediaSourceCount%2CBasicSyncInfo&ImageTypeLimit=1&EnableImageTypes=Primary%2CBackdrop%2CBanner%2CThumb&StartIndex=0&ParentId=f137a2dd21bbc1b99aa5c0f6bf02a805&Limit=1000&apikey=$apikey" | jq -r '.Items'
