FROM mxwilliam/mxck:mxck-foxy-pytorch-l4t-35.4-core

# Copy custom ROS entrypoint script into the container
COPY ./ros_entrypoint.sh /ros_entrypoint.sh

# Automatically source the ROS entrypoint script when a new shell starts
RUN echo 'source /ros_entrypoint.sh' >> ~/.bashrc

# Copy your local .git-credentials into the container
COPY .git-credentials /root/.git-credentials

# Fix permissions
RUN chmod 644 /root/.git-credentials

# Configure Git for root
RUN git config --global credential.helper store && \
    git config --global user.name "wiengel-hm" && \
    git config --global user.email "wengel@hm.edu"

# Copy bash aliases and set up for root
COPY .bash_aliases /root/.bash_aliases
RUN echo 'source /root/.bash_aliases' >> /root/.bashrc

# Set default user to root
USER root

# Install ros2_numpy
RUN python3 -m pip install --no-cache-dir git+https://github.com/william-mx/ros2_numpy.git
