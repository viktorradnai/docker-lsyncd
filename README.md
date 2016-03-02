#Docker Lsyncd container

This container uses Lsyncd (with inotify and Rsync + SSH) to keep two directories in sync.

## Available Configuration Parameters

* **DELAY**: All actions will aggregate events up to `delay` seconds. Defalt to `5`
* **SOURCE_DIR**: Source directory you want to synced. `Required` no default.
  **SOURCE_PERM**: Permissions to use when creating source dir. Default is 0755.
  **SOURCE_USER**: Owner for the source directory. Default is root.
  **SOURCE_GROUP**: Owning group for the source directory. Default is root.
  **SOURCE_PORT**: Port for SSH to listen on. Default is 2222.
  **TARGET_HOST**: Remote host to sync files to.
  **TARGET_PORT**: Remote port to connect to using SSH. Default is 2222.
  **TARGET_DIR**: Target dir you want to sync to. `Required` no default.
