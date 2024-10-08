#
#  Copyright (c) 2020, The OpenThread Authors.
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

set(COMMON_INCLUDES
    ${PROJECT_SOURCE_DIR}/openthread/include
    ${PROJECT_SOURCE_DIR}/openthread/src
    ${PROJECT_SOURCE_DIR}/openthread/src/core
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio/fem
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio/fem/three_pin_gpio
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio/mac_features
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio/mac_features/ack_generator
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio/platform/temperature
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio/platform/lp_timer
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio/rsch
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio/rsch/raal
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/radio/rsch/raal/softdevice
)

set(EXAMPLE_INCLUDES
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/cmsis
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/dependencies
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/drivers/clock
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/drivers/common
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/drivers/power
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/drivers/systick
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/drivers/usbd
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/app_error
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/atfifo
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/atomic
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/block_dev
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/delay
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/usb
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/usb/config
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/usb/class/cdc
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/usb/class/cdc/acm
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/libraries/utf_converter
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/nrfx
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/nrfx/hal
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/nrfx/drivers
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/nrfx/drivers/include
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/nrfx/mdk
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/nrfx/soc
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/softdevice/s140/headers
    ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/softdevice/s140/headers/nrf52
)

set(COMMON_FLAG
    -DSPIS_ENABLED=1
    -DSPIS0_ENABLED=1
    -DNRFX_SPIS_ENABLED=1
    -DNRFX_SPIS0_ENABLED=1
    -DCONFIG_GPIO_AS_PINRESET
    -DENABLE_FEM=1
    -DUSE_APP_CONFIG=1
    -DCONFIG_BOARD_ARDUINO_NANO_33_BLE_SENSE
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
)

set(COMMON_SOURCES
    dependencies/app_util_platform.c
    drivers/clock/nrf_drv_clock.c
    drivers/power/nrf_drv_power.c
    libraries/app_error/app_error.c
    libraries/app_error/app_error_weak.c
    libraries/utf_converter/utf.c
    nrfx/drivers/src/nrfx_clock.c
    nrfx/drivers/src/nrfx_nvmc.c
    nrfx/drivers/src/nrfx_power.c
    nrfx/drivers/src/nrfx_spis.c
    nrfx/drivers/src/nrfx_systick.c
    nrfx/hal/nrf_ecb.c
    nrfx/hal/nrf_nvmc.c
    nrfx/soc/nrfx_atomic.c
)

set(USB_SOURCES
    nrfx/drivers/src/nrfx_usbd.c
    libraries/atfifo/nrf_atfifo.c
    libraries/atomic/nrf_atomic.c
    libraries/usb/app_usbd.c
    libraries/usb/app_usbd_core.c
    libraries/usb/app_usbd_string_desc.c
    libraries/usb/app_usbd_serial_num.c
    libraries/usb/app_usbd_nrf_dfu_trigger.c
    libraries/usb/nrf_dfu_trigger_usb.c
    libraries/usb/class/cdc/acm/app_usbd_cdc_acm.c
)

set(RADIO_DRIVER_SOURCES
    drivers/radio/fal/nrf_802154_fal.c
    drivers/radio/mac_features/ack_generator/nrf_802154_ack_data.c
    drivers/radio/mac_features/ack_generator/nrf_802154_ack_generator.c
    drivers/radio/mac_features/ack_generator/nrf_802154_enh_ack_generator.c
    drivers/radio/mac_features/ack_generator/nrf_802154_imm_ack_generator.c
    drivers/radio/mac_features/nrf_802154_csma_ca.c
    drivers/radio/mac_features/nrf_802154_delayed_trx.c
    drivers/radio/mac_features/nrf_802154_filter.c
    drivers/radio/mac_features/nrf_802154_frame_parser.c
    drivers/radio/mac_features/nrf_802154_precise_ack_timeout.c
    drivers/radio/fem/three_pin_gpio/nrf_fem_three_pin_gpio.c
    drivers/radio/nrf_802154_core_hooks.c
    drivers/radio/nrf_802154_core.c
    drivers/radio/nrf_802154_critical_section.c
    drivers/radio/nrf_802154_debug.c
    drivers/radio/nrf_802154_pib.c
    drivers/radio/nrf_802154_rssi.c
    drivers/radio/nrf_802154_rx_buffer.c
    drivers/radio/nrf_802154_timer_coord.c
    drivers/radio/nrf_802154.c
    drivers/radio/platform/coex/nrf_802154_wifi_coex_none.c
    drivers/radio/platform/clock/nrf_802154_clock_ot.c
    drivers/radio/platform/hp_timer/nrf_802154_hp_timer.c
    drivers/radio/rsch/nrf_802154_rsch_crit_sect.c
    drivers/radio/rsch/nrf_802154_rsch.c
    drivers/radio/timer_scheduler/nrf_802154_timer_sched.c
)

set(SINGLE_PHY_SOURCES
    drivers/radio/nrf_802154_notification_direct.c
    drivers/radio/nrf_802154_priority_drop_direct.c
    drivers/radio/nrf_802154_request_direct.c
    drivers/radio/rsch/raal/single_phy/single_phy.c
)

set(RADIO_DRIVER_SOFTDEVICE_SOURCES
    drivers/radio/nrf_802154_notification_swi.c
    drivers/radio/nrf_802154_priority_drop_swi.c
    drivers/radio/nrf_802154_request_swi.c
    drivers/radio/nrf_802154_swi.c
    drivers/radio/rsch/raal/softdevice/nrf_raal_softdevice.c
)

set(RADIO_DRIVER_SINGLE_PHY_SOURCES
    drivers/radio/nrf_802154_notification_direct.c
    drivers/radio/nrf_802154_priority_drop_direct.c
    drivers/radio/nrf_802154_request_direct.c
    drivers/radio/rsch/raal/single_phy/single_phy.c
)

if(NRF_PLATFORM STREQUAL "nrf52811")
    add_library(nordicsemi-nrf52811-sdk)
    target_compile_definitions(nordicsemi-nrf52811-sdk
        PRIVATE
            ${COMMON_FLAG}
            -DNRF52811_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
            -D__HEAP_SIZE=0
            -D__STACK_SIZE=2048
    )
    target_include_directories(nordicsemi-nrf52811-sdk
        PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/nrf52811
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52811/config
    )
    set_property(SOURCE nrfx/mdk/gcc_startup_nrf52811.S PROPERTY LANGUAGE C)
    target_sources(nordicsemi-nrf52811-sdk
        PRIVATE
            ${COMMON_SOURCES}
            nrfx/mdk/gcc_startup_nrf52811.S
            nrfx/mdk/system_nrf52811.c
    )
    target_link_libraries(nordicsemi-nrf52811-sdk PRIVATE ot-config)

    add_library(nordicsemi-nrf52811-radio-driver)
    target_compile_definitions(nordicsemi-nrf52811-radio-driver
        PRIVATE
            ${COMMON_FLAG}
            -DNRF52811_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
            -D__HEAP_SIZE=0
            -D__STACK_SIZE=2048
            -DRAAL_SINGLE_PHY=1
    )
    target_include_directories(nordicsemi-nrf52811-radio-driver
        PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${OT_PUBLIC_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/nrf52811
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52811/config
    )
    target_sources(nordicsemi-nrf52811-radio-driver
        PRIVATE
            ${RADIO_DRIVER_SOURCES}
            ${RADIO_DRIVER_SINGLE_PHY_SOURCES}
    )
    target_link_libraries(nordicsemi-nrf52811-radio-driver PRIVATE ot-config)
elseif(NRF_PLATFORM STREQUAL "nrf52833")
    add_library(nordicsemi-nrf52833-sdk)
    target_compile_definitions(nordicsemi-nrf52833-sdk
        PRIVATE
            ${COMMON_FLAG}
            -DNRF52833_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
    )
    target_include_directories(nordicsemi-nrf52833-sdk
        PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/nrf52833
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52833/config
    )
    set_property(SOURCE nrfx/mdk/gcc_startup_nrf52833.S PROPERTY LANGUAGE C)
    target_sources(nordicsemi-nrf52833-sdk
        PRIVATE
            ${COMMON_SOURCES}
            ${USB_SOURCES}
            nrfx/mdk/gcc_startup_nrf52833.S
            nrfx/mdk/system_nrf52833.c
    )
    target_link_libraries(nordicsemi-nrf52833-sdk PRIVATE ot-config)

    add_library(nordicsemi-nrf52833-radio-driver)
    target_compile_definitions(nordicsemi-nrf52833-radio-driver
        PRIVATE
            ${COMMON_FLAG}
            -DNRF52833_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
            -DRAAL_SINGLE_PHY=1
    )
    target_include_directories(nordicsemi-nrf52833-radio-driver
        PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${OT_PUBLIC_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/nrf52833
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52833/config
    )
    target_sources(nordicsemi-nrf52833-radio-driver
        PRIVATE
            ${RADIO_DRIVER_SOURCES}
            ${RADIO_DRIVER_SINGLE_PHY_SOURCES}
    )
    target_link_libraries(nordicsemi-nrf52833-radio-driver PRIVATE ot-config)

    add_library(nordicsemi-nrf52833-radio-driver-softdevice)
    target_compile_definitions(nordicsemi-nrf52833-radio-driver-softdevice
        PRIVATE
            ${COMMON_FLAG}
            -DNRF52833_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
            -DRAAL_SINGLE_PHY=1
            -DSOFTDEVICE_PRESENT
            -DS140
            -DRAAL_SOFTDEVICE=1
    )
    target_include_directories(nordicsemi-nrf52833-radio-driver-softdevice
        PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${OT_PUBLIC_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/nrf52833
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52833/config
    )
    target_sources(nordicsemi-nrf52833-radio-driver-softdevice
        PRIVATE
            ${RADIO_DRIVER_SOURCES}
            ${RADIO_DRIVER_SINGLE_PHY_SOURCES}
    )
    target_link_libraries(nordicsemi-nrf52833-radio-driver-softdevice PRIVATE ot-config)
elseif(NRF_PLATFORM STREQUAL "nrf52840")
    add_library(nordicsemi-nrf52840-sdk)
    target_compile_definitions(nordicsemi-nrf52840-sdk
        PRIVATE
            ${COMMON_FLAG}
            -DNRF52840_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
    )
    target_include_directories(nordicsemi-nrf52840-sdk
        PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/nrf52840/
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52840/config
    )
    set_property(SOURCE nrfx/mdk/gcc_startup_nrf52840.S PROPERTY LANGUAGE C)
    target_sources(nordicsemi-nrf52840-sdk
        PRIVATE
            ${COMMON_SOURCES}
            ${USB_SOURCES}
            nrfx/mdk/gcc_startup_nrf52840.S
            nrfx/mdk/system_nrf52840.c
    )
    target_link_libraries(nordicsemi-nrf52840-sdk PRIVATE ot-config)

    add_library(nordicsemi-nrf52840-radio-driver)
    target_compile_definitions(nordicsemi-nrf52840-radio-driver
        PRIVATE
            ${COMMON_FLAG}
            -DNRF52840_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
            -DRAAL_SINGLE_PHY=1
    )
    target_include_directories(nordicsemi-nrf52840-radio-driver
        PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${OT_PUBLIC_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/nrf52840/
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52840/config
    )
    target_sources(nordicsemi-nrf52840-radio-driver
        PRIVATE
            ${RADIO_DRIVER_SOURCES}
            ${RADIO_DRIVER_SINGLE_PHY_SOURCES}
    )
    target_link_libraries(nordicsemi-nrf52840-radio-driver PRIVATE ot-config)

    add_library(nordicsemi-nrf52840-radio-driver-softdevice)
    target_compile_definitions(nordicsemi-nrf52840-radio-driver-softdevice
        PRIVATE
            ${COMMON_FLAG}
            -DNRF52840_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
            -DRAAL_SINGLE_PHY=1
            -DSOFTDEVICE_PRESENT
            -DS140
            -DRAAL_SOFTDEVICE=1
    )
    target_include_directories(nordicsemi-nrf52840-radio-driver-softdevice
        PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${OT_PUBLIC_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/nrf52840/
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52840/config
    )
    target_sources(nordicsemi-nrf52840-radio-driver-softdevice
        PRIVATE
            ${RADIO_DRIVER_SOURCES}
            ${RADIO_DRIVER_SINGLE_PHY_SOURCES}
    )
    target_link_libraries(nordicsemi-nrf52840-radio-driver-softdevice PRIVATE ot-config)
elseif(NRF_PLATFORM STREQUAL "arduino")
    add_library(nordicsemi-nrf52840-sdk)
    target_compile_definitions(nordicsemi-nrf52840-sdk
            PRIVATE
            ${COMMON_FLAG}
            -DNRF52840_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
            )
    target_include_directories(nordicsemi-nrf52840-sdk
            PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/arduino/
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52840/config
            )
    set_property(SOURCE nrfx/mdk/gcc_startup_nrf52840.S PROPERTY LANGUAGE C)
    target_sources(nordicsemi-nrf52840-sdk
            PRIVATE
            ${COMMON_SOURCES}
            ${USB_SOURCES}
            nrfx/mdk/gcc_startup_nrf52840.S
            nrfx/mdk/system_nrf52840.c
            )
    target_link_libraries(nordicsemi-nrf52840-sdk PRIVATE ot-config)

    add_library(nordicsemi-nrf52840-radio-driver)
    target_compile_definitions(nordicsemi-nrf52840-radio-driver
            PRIVATE
            ${COMMON_FLAG}
            -DNRF52840_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
            -DRAAL_SINGLE_PHY=1
            )
    target_include_directories(nordicsemi-nrf52840-radio-driver
            PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${OT_PUBLIC_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/arduino/
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52840/config
            )
    target_sources(nordicsemi-nrf52840-radio-driver
            PRIVATE
            ${RADIO_DRIVER_SOURCES}
            ${RADIO_DRIVER_SINGLE_PHY_SOURCES}
            )
    target_link_libraries(nordicsemi-nrf52840-radio-driver PRIVATE ot-config)

    add_library(nordicsemi-nrf52840-radio-driver-softdevice)
    target_compile_definitions(nordicsemi-nrf52840-radio-driver-softdevice
            PRIVATE
            ${COMMON_FLAG}
            -DNRF52840_XXAA
            -DNRF_802154_PROJECT_CONFIG=\"platform-config.h\"
            -DRAAL_SINGLE_PHY=1
            -DSOFTDEVICE_PRESENT
            -DS140
            -DRAAL_SOFTDEVICE=1
            )
    target_include_directories(nordicsemi-nrf52840-radio-driver-softdevice
            PUBLIC
            ${COMMON_INCLUDES}
            ${EXAMPLE_INCLUDES}
            ${OT_PUBLIC_INCLUDES}
            ${PROJECT_SOURCE_DIR}/src/arduino/
            ${PROJECT_SOURCE_DIR}/third_party/NordicSemiconductor/config/nrf52840/config
            )
    target_sources(nordicsemi-nrf52840-radio-driver-softdevice
            PRIVATE
            ${RADIO_DRIVER_SOURCES}
            ${RADIO_DRIVER_SINGLE_PHY_SOURCES}
            )
    target_link_libraries(nordicsemi-nrf52840-radio-driver-softdevice PRIVATE ot-config)
else()
    message(FATAL_ERROR "Platform unknown: ${NRF_PLATFORM}")
endif()

add_library(nordicsemi-mbedtls INTERFACE)

target_link_libraries(nordicsemi-mbedtls
    INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libmbedcrypto_shared.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libmbedtls_tls_vanilla.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libmbedtls_x509_vanilla.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libmbedcrypto_cc3xx.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libnrf_cc310_platform_0.9.4.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libmbedcrypto_oberon.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libmbedtls_base_vanilla.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libmbedcrypto_cc3xx.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libmbedtls_base_vanilla.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libmbedcrypto_shared.a
        ${CMAKE_CURRENT_SOURCE_DIR}/libraries/nrf_security/lib/libnrf_cc310_platform_0.9.4.a
)

