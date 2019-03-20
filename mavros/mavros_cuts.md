# Nota: tudo que vem abaixo não é necessário no ROS Kinetic

    Baixando os datasets da GeoGraphic Lib

    wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
    ./install_geographiclib_datasets.sh


    sudo chmod a+x install_geographiclib_datasets.sh 

    sudo ./install_geographiclib_datasets.sh 



    cd ~/catkin_ws
    wstool init src

    sudo apt-get install python-catkin-tools python-rosinstall-generator -y


    rosinstall_generator --rosdistro kinetic mavlink | tee /tmp/mavros.rosinstall


    Instalando a versão estável do Mavros

    rosinstall_generator --upstream mavros --deps | tee -a /tmp/mavros.rosinstall

    Sem as dependências

    rosinstall_generator --upstream mavros  | tee -a /tmp/mavros.rosinstall


    Nota: para a versão mais recente, use `rosinstall_generator --upstream-development mavros | tee -a /tmp/mavros.rosinstall
    `


    wstool merge -t src /tmp/mavros.rosinstall
    wstool update -t src -j4
    rosdep install --from-paths src --ignore-src -y

    Nota:

    O script de instalar o Geo Lib deveria estar em:
    ./src/mavros/mavros/scripts/install_geographiclib_datasets.sh

    Mas não encontro


Tentando rodar o exemplo de offboard control
https://dev.px4.io/en/ros/mavros_offboard.html


criando pack ros
catkin_create_pkg pfe_insper std_msgs mavros_msgs geometry_msgs rospy roscpp


# PX4 - tentativas

Bem-sucedido, sem Gazebo 

  roslaunch  mavros px4.launch fcu_url:="udp://:14540@127.0.0.1:14557"

Tentativa unificada:

    roslaunch px4 mavros_posix_sitl.launch  -w -v

Adicionar:
    -w -v




cd ~/catkin_ws/src/Firmware

make posix_sitl_default gazebo


# Deu certo! - iniciou a simulação

**mas** o catkin_make falhava para os outros pacotes por causa deste pacote neste diretório

solução: tentar catkin_make_isolated

# Link sobre mais simulações

https://404warehouse.net/2016/07/11/px4-software-in-the-loopsitl-simulation-on-gazebo/




Simulação  com ROS:

roslaunch mavros px4.launch fcu_url:="udp://:14540@127.0.0.1:14557"

No diretório do firmware deu certo!

... mas não abriu o visual
