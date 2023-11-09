
function docker-refresh-openapi
    set webhash (docker ps | grep -m 1 "hermes_web" | awk '{print $1}')
    set webname (docker ps | grep -m 1 "hermes_web" | awk '{print $2}')
    set fehash (docker ps | grep -m 1 "hermes_frontend" | awk '{print $1}')
    set fename (docker ps | grep -m 1 "hermes_frontend" | awk '{print $2}')
    # read webhash webname <<< (docker ps | grep -m 1 "hermes_web" | awk '{print $1 " " $2}')
    # read fehash fename <<< (docker ps | grep -m 1 "hermes_frontend" | awk '{print $1 " " $2}')

    if [ -z "$webhash" ] && [ -z "$fehash" ]
        echo "*** The Hermes web and/or frontend container is not running!"
    else
        echo "===== Copying $1 to $fename ====="
        docker cp $1 $fehash:/app/hermes/public/__openapi__

        echo "===== Rebuilding the openapi.yml file and copying... ====="
        docker exec $fehash /bin/bash -c "npx @redocly/cli bundle /app/hermes/public/__openapi__/openapi.yml --output /app/hermes/public/openapi.yml --ext yml"

        echo "===== Copying the combined file to the $webname container... ====="
        docker cp $fehash:/app/hermes/public/openapi.yml combined_openapi.yml
        docker cp combined_openapi.yml $webhash:/app/hermes/public/openapi.yml
        rm combined_openapi.yml

        echo -e "===== Success! Restarting containers... ====="
        docker-compose restart web frontend app
    end
end

# function symlink --argument _from _to
#     if test "$_from" = ""; or test "$_to" = ""
#         echo "symlink: must provide from and to arguments"
#         return 1
#     end
#
#     set abs_to (realpath "$_to")
#
#     if test -d $_to && not test -d $_from
#         set to "$abs_to/"(basename $_from)
#     else
#         set to "$abs_to"
#     end
#
#     set from (realpath "$_from")
#
#     ln -s $from $to
# end
