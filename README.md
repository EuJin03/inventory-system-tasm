# APU Mini Grocery Inventory System User Manual

Welcome to the Mini Grocery Inventory System user manual. This document will guide you through the usage and functionality of the system.

## System Overview

The Mini Grocery Inventory System is a simple inventory management tool built using TASM assembly language. It helps manage a small grocery store's inventory by providing basic features such as viewing the inventory, restocking items, selling items, categorizing inventory items by stock quantity, and generating sales reports.

## Requirements

- [DOSBox](https://www.dosbox.com/download.php)
- [TASM](https://sourceforge.net/projects/guitasm8086/) (Turbo Assembler) and TLINK (Turbo Linker)

## Usage

1. Clone this repository to your local machine within the `TASM` directory of DOSBox
2. Navigate to the TASM directory of the project in your terminal
3. Run the following commands to compile the assembly source code and generate the executable file:

```bash
tasm <file>.asm

tlink <file>.obj

<file>.exe
```

## Getting Started

To begin using the Mini Grocery Inventory System, compile the provided assembly source code and run the executable. The system will display the main menu, which provides the following options:

1. View Inventory
2. Restock Item
3. Sell Items
4. Sort Items
5. Sales Report
6. Exit the Program

Enter the corresponding number for the desired action.

## Feature Details

Below is a detailed explanation of each feature in the Mini Grocery Inventory System:

### 1. View Inventory

This feature allows you to view the current inventory of the grocery store. It displays the items with their respective ID, name, quantity, and price. Items that need restocking are displayed in red.

### 2. Restock Item

This feature enables you to restock items in the inventory. To restock an item, first, view the inventory, then select the item's ID you wish to restock. Next, enter the amount to restock (between 1 and 9). A success message will be displayed once the item has been restocked, and the updated inventory will be shown.

### 3. Sell Items

This feature allows you to record the sale of items in the inventory. To sell an item, first, view the inventory, then enter the item's ID you wish to sell. Next, enter the amount to sell (between 1 and 9). If there is enough quantity, a success message will be displayed, and the updated inventory will be shown. If there is not enough quantity, an error message will be displayed.

### 4. Sort Items

This feature helps you categorize the inventory items based on their stock count. You can choose to display items that are in stock, low on stock, or out of stock.

### 5. Sales Report

This feature generates a sales report that shows the sales made during the day. The report includes the item ID, name, quantity sold, price per unit, and total earned for each item. You can navigate back to the main menu or exit the program from the sales report screen.

### 0. Exit the Program

This option allows you to exit the Mini Grocery Inventory System safely.

## Navigation

During the usage of the system, you can navigate between different features using the provided menu options. In most cases, you can return to the main menu or exit the program by entering the appropriate choice.

## Troubleshooting

If you encounter any issues or errors, make sure that you have entered valid input for each operation. If the problem persists, please review the assembly source code for any syntax or logic errors.

## Conclusion

This user manual has provided an overview of the Mini Grocery Inventory System's features and functionality. By following the instructions and understanding each feature, you should be able to manage your small grocery store's inventory effectively. If you have any questions or require further assistance, please refer to the provided source code for additional information and examples.
