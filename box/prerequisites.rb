module Utility

    class DebianCustom < VagrantVbguest::Installers::Debian

        def install(opts=nil, &block)

            cmd = <<~SCRIPT
                apt-get -y update
                DEBIAN_FRONTEND=noninteractive apt-get upgrade -o Dpkg::Options::="--force-confold" --force-yes -y
                DEBIAN_FRONTEND=noninteractive apt-get install -o Dpkg::Options::="--force-confold" --force-yes -y build-essential linux-headers-amd64 linux-image-amd64 python-pip
                cat <<EOF > /etc/apt/sources.list.d/snapshot_archive.list
                deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20190812T140702Z/ buster main
                deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20190812T140702Z/ buster/updates main
                EOF
                apt-get -y update
            SCRIPT

            communicate.sudo(cmd, opts, &block)

            super
        end

        def cleanup

            communicate.sudo('rm /etc/apt/sources.list.d/snapshot_archive.list && apt-get -y update')
            
            super
        end
    end
end