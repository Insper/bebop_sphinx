
## Setup

Link do tutorial (que fui adaptando)

[https://bebop-autonomy.readthedocs.io/en/latest/installation.html](https://bebop-autonomy.readthedocs.io/en/latest/installation.html)

Criei o diretório `catkin_ws` 

Dentro do `catkin_ws`, foi emitido o comando `catkin_init_workspace`

Depois: 
    cd catkin_ws/src

Em seguida: 

    git clone https://github.com/AutonomyLab/bebop_autonomy.git

Depois

    rosdep update

No diretório

    cd    catkin_ws


Rodar

    rosdep install --from-paths src -i

depois, para compilar:

    cd ~/catkin_ws/src

    catkin_make


## Como conectar no drone

Antes de se conectar, certifique-se de que a linha a seguir faz parte do arquivo  `.bashrc` 

    source ~/catkin_ws/devel/setup.bash

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



## Simuladores:

Precisamos avaliar os dois simuladores:

TUM Simulator

[http://wiki.ros.org/tum_simulator](http://wiki.ros.org/tum_simulator)


Sphinx Gazebo:

[Sphinx Gazebo](https://www.youtube.com/watch?v=JaDAyMki31o)




Como executar um Flight Plan autônomo via Python no Bebop:

[https://bebop-autonomy.readthedocs.io/en/latest/piloting.htm](https://bebop-autonomy.readthedocs.io/en/latest/piloting.html)



### Exemplo interessante mesclando real e virtual

[Visual servoing](http://repositorio.upct.es/bitstream/handle/10317/5442/pfc6362.pdf?sequence=1)




