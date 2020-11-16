
# Setup a partir do zero

Link do tutorial original (que fui adaptando)

[https://bebop-autonomy.readthedocs.io/en/latest/installation.html](https://bebop-autonomy.readthedocs.io/en/latest/installation.html)

## Para quem não esta usando o ssd disponibilizado de robotica 

Crie o diretório `~/catkin_ws` 

Dentro do `~/catkin_ws`, foi emitido o comando `catkin_init_workspace`

Depois: 

    cd ~/catkin_ws/src

Em seguida: 
 
    git clone https://github.com/AutonomyLab/bebop_autonomy.git

Depois

    rosdep update

No diretório

    cd ~/catkin_ws

Rodar

    rosdep install --from-paths src -i

depois, para compilar:

    catkin_make

## Resolvendo problemas do catkin_make

Caso ocorra alguma falha durante o catkin_make, ou seja, a compilação não chegar até 100%. Podemso tentar resolver de algumas formas. 

### Trocar repositório bebop_autonomy

Alguns arquivos do repositorio oficial não foram atualizados para as versões mais recentes do ROS. Algumas dessas correções foram feitas no fork abaixo:

    cd ~/catkin_ws/src
    rm -rf bebop_autonomy
    git clone https://github.com/arnaldojr/bebop_autonomy.git
    cd ~/catkin_ws/
    catkin_make

### Limpar o workspace clean

Exclua as pastas "build" e "devel" e tente novamente:

Asim:

    cd ~/catkin_ws
    rm -rf build devel
    catkin_make

ou assim:

    cd ~/catkin_ws
    catkin clean
    catkin_make

### Criar um novo workspace

Caso ainda apresente problemas, podemos criar um novo workspace para tentar resolver, vamos chamar esse novo de workspace de bebop_ws. 

    mkdir -p ~/bebop_ws/src && cd ~/bebop_ws
    catkin init
    cd ~/bebop_ws/src
    git clone https://github.com/arnaldojr/bebop_autonomy.git
    rosdep update
    rosdep install --from-paths src -i
    catkin_make

Lembre-se que mudamos o nome do workspace, não é mais catkin_ws, atualize o seu ".bashrc":
 
    cd ~
    export source ~/bebop_ws/devel/setup.bash

## Como conectar no drone se você já tem o bebop_autonomy instalado

Antes de se conectar, certifique-se de que a linha a seguir faz parte do arquivo  `.bashrc` 

    source ~/catkin_ws/devel/setup.bash

### Pré-requisitos

**1.** Certifique-se de que as variáveis `ROS_MASTER_URI` e `ROS_IP` estão desabilitadas no `~/.bashrc`

**2.** Anote o  número de série do drone antes de ligar.  O nome da rede em que você vai se conectar usa os 6 últimos caracteres do número serial. Para saber o número serial é preciso **remover a bateria** antes de iniciar o drone.

**3.** Conecte-se ao *access point* do *drone* via *wi-fi*.

**4.** Verifique se a conexão está funcionado:

    ping 192.168.42.1

### Conexão

Abrir um novo terminal. ara conectar com o drone 

    roslaunch bebop_driver bebop_node.launch

Para abrir a imagem:

    rqt_image_view 

Para visualizar os tópicos:

    rostopic list
    rqt_graph

Para fazer o drone decolar via terminal:

    rostopic pub --once bebop/takeoff std_msgs/Empty

Para fazer o drone pousar, via terminal (é aconselhável deixá-lo perto do solo)


    rostopic pub --once bebop/land std_msgs/Empty

Para controlar o drone via teleop de teclado:

    rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=bebop/cmd_vel

### Como resolver problemas no launch para conectar com o bebop

Se acontecer falhas no comando roslaunch bebop_driver bebop_node.launch, pode ser que a porta de comunicação esteja bloqueada pelo firewall.

    sudo ufw allow 55005
    sudo ufw allow 55004
    sudo ufw allow 43210


## Projetos demo de alunos:

O que rodar:

[https://github.com/PhelipeMuller/PetDrone](https://github.com/PhelipeMuller/PetDrone)


Como eu rodei:

    cd ~/catkin_ws/src
    git clone https://github.com/PhelipeMuller/PetDrone
    cd PetDrone/
    cd projeto/
    python takeoffnland.py 


[https://github.com/decoejz/robotica_p3](https://github.com/decoejz/robotica_p3)

Como eu rodei:

    cd ~/catkin_ws/src
    git clone https://github.com/decoejz/robotica_p3
    cd robotica_p3/
    cd scripts/
    python ./drone_drive.py 



### Exemplo interessante mesclando real e virtual

[Visual servoing](http://repositorio.upct.es/bitstream/handle/10317/5442/pfc6362.pdf?sequence=1)




