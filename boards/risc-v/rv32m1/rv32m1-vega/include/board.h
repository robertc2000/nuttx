/****************************************************************************
 * boards/risc-v/rv32m1/rv32m1-vega/include/board.h
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.  The
 * ASF licenses this file to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 ****************************************************************************/

#ifndef __BOARDS_RISCV_RV32M1_RV32M1_VEGA_INCLUDE_BOARD_H
#define __BOARDS_RISCV_RV32M1_RV32M1_VEGA_INCLUDE_BOARD_H

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <nuttx/config.h>

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

#define LED_STARTED       0  /* N/A */
#define LED_HEAPALLOCATE  1  /* N/A */
#define LED_IRQSENABLED   2  /* N/A */
#define LED_STACKCREATED  3  /* N/A */
#define LED_INIRQ         4  /* N/A */
#define LED_SIGNAL        5  /* N/A */
#define LED_ASSERTION     6  /* N/A */
#define LED_PANIC         7  /* N/A */
#define LED_CPU           8  /* LED */

/****************************************************************************
 * Public Types
 ****************************************************************************/

#define GPIO_LPUART0_RX    GPIO_LPUART0_RX_1  /* PC7 */
#define GPIO_LPUART0_TX    GPIO_LPUART0_TX_1  /* PC8 */

#define GPIO_LPUART1_RX    GPIO_LPUART1_RX_4  /* PA25 */
#define GPIO_LPUART1_TX    GPIO_LPUART1_TX_4  /* PA26 */

#define GPIO_LPUART2_RX    GPIO_LPUART2_RX_1  /* PB11 */
#define GPIO_LPUART2_TX    GPIO_LPUART2_TX_1  /* PB12 */

#define GPIO_LPUART3_RX    GPIO_LPUART3_RX_2  /* PE8  */
#define GPIO_LPUART3_TX    GPIO_LPUART3_TX_3  /* PE30 */

#ifndef __ASSEMBLY__

/****************************************************************************
 * Public Data
 ****************************************************************************/

#undef EXTERN
#if defined(__cplusplus)
#define EXTERN extern "C"
extern "C"
{
#else
#define EXTERN extern
#endif

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

/****************************************************************************
 * Name: rv32m1_boardinitialize
 ****************************************************************************/

void rv32m1_boardinitialize(void);

#undef EXTERN
#if defined(__cplusplus)
}
#endif
#endif /* __ASSEMBLY__ */
#endif /* __BOARDS_RISC-V_RV32M1_RV32M1_VEGA_INCLUDE_BOARD_H */
