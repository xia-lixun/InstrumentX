################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/platform.c \
../src/rs255239.c 

LD_SRCS += \
../src/lscript.ld 

OBJS += \
./src/platform.o \
./src/rs255239.o 

C_DEPS += \
./src/platform.d \
./src/rs255239.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -pedantic -O3 -march=armv7-a -mtune=cortex-a9 -g3 -c -fmessage-length=0 -std=c99 -I../../app_cpu_1_bsp/ps7_cortexa9_1/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


