#
#  Copyright (c) 2021, The OpenThread Authors.
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#  3. Neither the name of the copyright holder nor the
#     names of its contributors may be used to endorse or promote products
#     derived from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
#  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
#  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
#  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
#  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
#  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
#  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
#  POSSIBILITY OF SUCH DAMAGE.
#

set(LD_FILE "${CMAKE_CURRENT_SOURCE_DIR}/arduino/arduino.ld")

list(APPEND OT_PLATFORM_DEFINES
    "OPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE=\"openthread-core-arduino-config-check.h\""
)
list(APPEND OT_PLATFORM_DEFINES "BOARD=arduino_nano_33_ble_sense")
list(APPEND OT_PLATFORM_DEFINES "CONF_FILE=prj.conf")
list(APPEND OT_PLATFORM_DEFINES "USB_DEVICE_STACK=1")
list(APPEND OT_PLATFORM_DEFINES "USB_CDC_ACM=1")
list(APPEND OT_PLATFORM_DEFINES "USB_DEVICE_INITIALIZE_AT_BOOT=1")

if(NOT OT_EXTERNAL_MBEDTLS)
    if(OT_MBEDTLS_THREADING)
        list(APPEND OT_PLATFORM_DEFINES "MBEDTLS_THREADING_C")
        list(APPEND OT_PLATFORM_DEFINES "MBEDTLS_THREADING_ALT")
        list(APPEND OT_PUBLIC_INCLUDES
            "${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/nrf_security/include/software-only-threading"
        )
    endif()
else()
    list(APPEND OT_PLATFORM_DEFINES "MBEDTLS_CONFIG_FILE=\"nrf-config.h\"")
    list(APPEND OT_PUBLIC_INCLUDES
        "${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/nrf_security/include"
        "${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/nrf_security/config"
        "${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/nrf_security/nrf_cc310_plat/include"
    )
endif()

set(OT_PLATFORM_DEFINES ${OT_PLATFORM_DEFINES} PARENT_SCOPE)
target_compile_definitions(ot-config INTERFACE
    "MBEDTLS_USER_CONFIG_FILE=\"nrf52840-mbedtls-config.h\""
)
list(APPEND OT_PUBLIC_INCLUDES "${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/nrf_security/mbedtls_plat_config")
set(OT_PUBLIC_INCLUDES ${OT_PUBLIC_INCLUDES} PARENT_SCOPE)

set(COMM_FLAGS
    -DCONFIG_BOARD_ARDUINO_NANO_33_BLE_SENSE
    -DCONFIG_GPIO_AS_PINRESET
    -DUSB_DEVICE_STACK=1
    -DUSB_CDC_ACM=1
    -DUSB_DEVICE_INITIALIZE_AT_BOOT=1
    -DUSB_CDC_AS_SERIAL_TRANSPORT=1
    -DCONFIG_PRINTK=1
    -DCONFIG_CONSOLE=1
    -DCONFIG_UART_CONSOLE=1
    -DCONFIG_LOG=1
    -DCONFIG_SERIAL=1
    -DUSB_DEVICE_MANUFACTURER=ARDUINO
    -DUSB_DEVICE_PRODUCT="Arduino Nano 33 BLE"
    -DAPP_USBD_STRINGS_PRODUCT="Arduino Nano 33 BLE"
    -DCONFIG_USB_DEVICE_VID=0x2341
    -DAPP_USBD_VID=0x2341
    -DCONFIG_USB_DEVICE_PID=0x005A
    -DAPP_USBD_PID=0x005A
    -DNRF52840_XXAA
    -DUSE_APP_CONFIG=1
    -DCONFIG_BOOTLOADER_BOSSA=1
    -DCONFIG_BOOTLOADER_BOSSA_LEGACY=1
    -DCONFIG_PINCTRL=1
    -DCONFIG_SHELL=1
    -DCONFIG_NET_SHELL=1
    -DCONFIG_OPENTHREAD_SHELL=1
    -DCONFIG_OPENTHREAD_PANID=EA62
    -DCONFIG_OPENTHREAD_CHANNEL=15
    -DCONFIG_OPENTHREAD_NETWORK_NAME="NanoleafThread88"
    -DCONFIG_OPENTHREAD_XPANID="b78f131967e9754c"
    -DCONFIG_OPENTHREAD_JOINER=1
    -DCONFIG_OPENTHREAD_JOINER_AUTOSTART=1
    -DCONFIG_OPENTHREAD_JOINER_PSKD="J01NU5"
    -DCONFIG_OPENTHREAD_SLAAC=1
    -Wno-unused-parameter
    -Wno-expansion-to-defined
)
if(OT_CFLAGS MATCHES "-pedantic-errors")
    string(REPLACE "-pedantic-errors" "" OT_CFLAGS "${OT_CFLAGS}")
endif()

set(OT_UART_BAUDRATE 115200 CACHE STRING "UART Baud rate. It must be a pre-defined
value in src/arduino/transport-config.h")
add_definitions(-DUART_BAUDRATE=NRF_UARTE_BAUDRATE_${OT_UART_BAUDRATE})

add_library(openthread-nrf52840
    ${NRF_COMM_SOURCES}
    ${NRF_SINGLEPHY_SOURCES}
    $<TARGET_OBJECTS:openthread-platform-utils>
)

add_library(openthread-nrf52840-transport
    ${NRF_TRANSPORT_SOURCES}
)

add_library(openthread-nrf52840-sdk
    ${NRF_COMM_SOURCES}
    ${NRF_SINGLEPHY_SOURCES}
    $<TARGET_OBJECTS:openthread-platform-utils>
)

add_library(openthread-nrf52840-softdevice-sdk
    ${NRF_COMM_SOURCES}
    ${NRF_SOFTDEVICE_SOURCES}
    $<TARGET_OBJECTS:openthread-platform-utils>
)

set_target_properties(openthread-nrf52840 openthread-nrf52840-transport openthread-nrf52840-sdk openthread-nrf52840-softdevice-sdk
    PROPERTIES
        C_STANDARD 99
        CXX_STANDARD 11
)

target_link_libraries(openthread-nrf52840
    PUBLIC
        ${OT_MBEDTLS}
        ${NRF52840_3RD_LIBS}
        -T${LD_FILE}
        -Wl,--gc-sections
        -Wl,-Map=$<TARGET_PROPERTY:NAME>.map
    PRIVATE
        ot-config
)

target_link_libraries(openthread-nrf52840-transport
    PUBLIC
        ${OT_MBEDTLS}
        -T${LD_FILE}
        -Wl,--gc-sections
        -Wl,-Map=$<TARGET_PROPERTY:NAME>.map
    PRIVATE
        nordicsemi-nrf52840-sdk
        ot-config
)

target_link_libraries(openthread-nrf52840-sdk
    PUBLIC
        ${OT_MBEDTLS}
        ${NRF52840_3RD_LIBS}
        -T${LD_FILE}
        -Wl,--gc-sections
        -Wl,-Map=$<TARGET_PROPERTY:NAME>.map
    PRIVATE
        ot-config
)

target_link_libraries(openthread-nrf52840-softdevice-sdk
    PUBLIC
        ${OT_MBEDTLS}
        ${NRF52840_3RD_LIBS}
        -T${LD_FILE}
        -Wl,--gc-sections
        -Wl,-Map=$<TARGET_PROPERTY:NAME>.map
    PRIVATE
        ot-config
)

target_compile_definitions(openthread-nrf52840
    PUBLIC
        ${OT_PLATFORM_DEFINES}
)

target_compile_definitions(openthread-nrf52840-transport
    PUBLIC
        ${OT_PLATFORM_DEFINES}
)

target_compile_definitions(openthread-nrf52840-sdk
    PUBLIC
        ${OT_PLATFORM_DEFINES}
)

target_compile_definitions(openthread-nrf52840-softdevice-sdk
    PUBLIC
        ${OT_PLATFORM_DEFINES}
)

target_compile_options(openthread-nrf52840
    PRIVATE
        ${OT_CFLAGS}
        ${COMM_FLAGS}
        -DPLATFORM_OPENTHREAD_VANILLA
)

target_compile_options(openthread-nrf52840-transport
    PRIVATE
        ${OT_CFLAGS}
        ${COMM_FLAGS}
        -DPLATFORM_OPENTHREAD_VANILLA
)

target_compile_options(openthread-nrf52840-sdk
    PRIVATE
        ${OT_CFLAGS}
        ${COMM_FLAGS}
)

target_compile_options(openthread-nrf52840-softdevice-sdk
    PRIVATE
        ${OT_CFLAGS}
        ${COMM_FLAGS}
        -DSOFTDEVICE_PRESENT
        -DS140
)

target_include_directories(openthread-nrf52840
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/arduino
        ${NRF_INCLUDES}
        ${OT_PUBLIC_INCLUDES}
)

target_include_directories(openthread-nrf52840-transport
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/arduino
        ${NRF_INCLUDES}
        ${OT_PUBLIC_INCLUDES}
)

target_include_directories(openthread-nrf52840-sdk
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/arduino
        ${NRF_INCLUDES}
        ${OT_PUBLIC_INCLUDES}
)

target_include_directories(openthread-nrf52840-softdevice-sdk
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/arduino
        ${NRF_INCLUDES}
        ${OT_PUBLIC_INCLUDES}
)

target_include_directories(ot-config INTERFACE ${OT_PUBLIC_INCLUDES})
target_compile_definitions(ot-config INTERFACE ${OT_PLATFORM_DEFINES})
