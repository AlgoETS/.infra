#!/bin/bash

# AlgoETS ASCII art
echo "                                                             "
echo "                                                             "
echo "  █████╗ ██╗      ██████╗  ██████╗ ███████╗████████╗▄▄███▄▄· "
echo " ██╔══██╗██║     ██╔════╝ ██╔═══██╗██╔════╝╚══██╔══╝██╔════╝ "
echo " ███████║██║     ██║  ███╗██║   ██║█████╗     ██║   ███████╗ "
echo " ██╔══██║██║     ██║   ██║██║   ██║██╔══╝     ██║   ╚════██║ "
echo " ██║  ██║███████╗╚██████╔╝╚██████╔╝███████╗   ██║   ███████║ " 
echo " ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   ╚═▀▀▀══╝ "
echo "                                                             "                                     
echo "                                                             "

# Update motd
echo "Welcome to AlgoETS Server!"
echo "To access the AlgoETS platform, please visit https://algoets.ca"
echo ""

# Save motd to /etc/motd
echo "Welcome to AlgoETS Server!" > /etc/motd
echo "To access the AlgoETS platform, please visit https://algoets.ca" >> /etc/motd
echo "" >> /etc/motd
