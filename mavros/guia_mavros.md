
Fonte da primeira parte:

[http://wiki.ros.org/kinetic/Installation/Ubuntu]
(http://wiki.ros.org/kinetic/Installation/Ubuntu)



Adicionar os mirrors Ubuntu:

    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

Adicionar as chaves criptográficas dos pacotes:

    sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

Atualizar os pacotes do Ubuntu:

    sudo apt-get update

Instalar o ROS:

    sudo apt-get install ros-kinetic-desktop-full

Iniciar o subsystem ROS:

    sudo rosdep init
    rosdep update

**Nota**: se você obtiver a seguinte mensagem

E: Não foi possível obter trava /var/lib/dpkg/lock - open (11: Recurso temporariamente indisponível)

Faça o seguinte:

    sudo rm /var/lib/apt/lists/lock
    sudo rm /var/cache/apt/archives/lock
    sudo rm /var/lib/dpkg/lock


Adicionar o ROS às suas variáveis de ambiente (especialmente `PATH`)

    echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
    source ~/.bashrc

Dependências de build

    sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential


Fonte para a continuação:

[http://wiki.ros.org/kinetic/Installation/Ubuntu]
(http://wiki.ros.org/kinetic/Installation/Ubuntu)

Vamos omitirs os pacotes do Turblebot e instalar os pacotes básicos do ROS


    sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers

Pacotes para transmissão de vídeo:

    sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-* gstreamer1.0-libav* gstreamer1.0-plugins*


Pacotes para 

    sudo apt-get install hping3
    sudo setcap cap_net_raw+ep /usr/sbin/hping3


Criando o workspace

    source /opt/ros/kinetic/setup.bash
    mkdir -p ~/catkin_ws/src
    cd ~/catkin_ws/src
    catkin_init_workspace
    cd ..
    catkin_make


Garantir que os pacotes ROS do nosso `catkin` customizados também são encontrados pelo sistema operacional, através da adição dos mesmos ao `.bashrc` .

    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

Agora passamos ao guia específico do MAVROS:


[https://dev.px4.io/en/ros/mavros_installation.html](https://dev.px4.io/en/ros/mavros_installation.html)


Instalação dos pacotes do MAVROS:

    sudo apt-get install ros-kinetic-mavros ros-kinetic-mavros-extras

Checkout de Firmware  do PX4. Sugerimos trabalhar no diretório `~/src``

    cd ~/src

Baixar:

    git clone https://github.com/PX4/Firmware

Precisamos instalar as dependências Python-Jinja2 e Toml:

    sudo apt-get install python-jinja2 	
    sudo apt install python-toml

Precisamos instalar os pré-requisitos para simular com o Gazebo:

    cd ~/src
    wget https://raw.githubusercontent.com/PX4/Devguide/master/build_scripts/ubuntu_sim_ros_gazebo.sh

Agora executar o script:

    chmod a+x ./ubuntu_sim_ros_gazebo.sh
    sudo ./ubuntu_sim_ros_gazebo.sh # Nota do Miranda: não sei se o sudo é estritamente necessário



Referência para esta parte: [https://dev.px4.io/en/setup/dev_env_linux.html#gazebo-with-ros
](https://dev.px4.io/en/setup/dev_env_linux.html#gazebo-with-ros)

Compilando, finalmente:

    cd ~/src/Firmware
    make px4_sitl_default gazebo

Vai compilar por alguns minutos e abrir o simulador.


## Para abrir o simulador sem precisar compilar

Execute as linhas abaixo, ou as salve num script com a extensão `.sh`


    cd ~/src/Firmware
    source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
    export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
    export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo
    roslaunch px4 posix_sitl.launch



roslaunch mavros px4.launch fcu_url:="udp://:14540@127.0.0.1:14557"----conexao com drone

roslaunch px4 posix_sitl.launch---launch do gazebo


Comando uteis: 

Posicao e odometria:

rostopic echo /mavros/local_position/odom-----odometria local 

rostopic echo /mavros/global_position/global------ poisicao de acordo com GPS

rostopic echo /mavros/altitude---- apenas dados de altitude




Decolar e pousar:

    rosrun mavros mavsafety arm
----ligar os motores

rosrun mavros mavsafety disarm----desligar os motores

rosrun mavros mavcmd takeoff----- levantar voo (checar argumentos)

rosrun mavros mavcmd land----- pousar (checar argumentos)




Informacoes sobre a bateria: 

rostopic echo /mavros/battery----bateria do drone








