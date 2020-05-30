Set-Alias ll "ls"
function la {
    ls -Force
}

# NOTE(rkm 2020-05-30) Points the local docker CLI at the daemon on a VM, since
#                      we want to use VirtualBox instead of Hyper-V.
Function docker {
    docker.exe -H 192.168.56.XXX:2376 "$args"
}
