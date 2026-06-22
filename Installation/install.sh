sudo apt-get install python3-wstool python3-catkin-tools python3-rosdep ros-noetic-moveit-visual-tools ros-noetic-panda-moveit-config ros-noetic-moveit ccache ros-noetic-py-binding-tools python3-pybind11 pybind11-dev ros-noetic-rosparam-shortcuts -y
source /opt/ros/noetic/setup.bash
mkdir ~/moveit_ws
cd ~/moveit_ws
wstool init src
wstool merge -t src https://raw.githubusercontent.com/moveit/moveit/master/moveit.rosinstall
wstool update -t src
git clone -b ros1-0.1.3 https://github.com/moveit/moveit_task_constructor src/moveit_task_constructor
rosdep update
rosdep install -y --from-paths src --ignore-src --rosdistro noetic -r
catkin config --extend /opt/ros/noetic --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin build
echo 'export PATH="/usr/lib/ccache:$PATH"' >> ~/.bashrc
echo 'source ~/moveit_ws/devel/setup.bash' >> ~/.bashrc
source ~/.bashrc
