#!/bin/sh
# wait-for-mysql.sh

set -e

host="$1"
shift
cmd="$@"

until mysql -h "$host" -u penggajian_admin -pPenggajian123!!! -e 'SELECT 1' &> /dev/null; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing migration"
php artisan migrate

>&2 echo "MySQL is up - executing command"
exec $cmd
