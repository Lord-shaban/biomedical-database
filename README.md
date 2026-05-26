# 🩺 Biomedical Centre - Beginner's Setup Guide

This guide explains step-by-step how to run the "Biomedical Centre" project on any new computer. It is written for non-technical users, so just follow the steps exactly as written!

---

## 🛠️ Step 0: Required Software (Install Once)
Before starting, you need to download and install these three free programs on the new computer just like installing any normal app:
1. **[Node.js](https://nodejs.org/)**: Download the "LTS" version and format it (Just click Next > Next > Finish).
2. **[XAMPP](https://www.apachefriends.org/index.html)**: This program creates our database space.
3. **[Visual Studio Code](https://code.visualstudio.com/) (VS Code)**: This is the program we use to open the project files.

---

## 🗄️ Step 1: Start the Database

1. Open the **XAMPP Control Panel** program from your computer's Start menu.
2. You will see a list of names. Click the **Start** button next to **"Apache"** and the **Start** button next to **"MySQL"**. (Their backgrounds should turn green).
3. Open your internet browser (like Google Chrome or Edge).
4. In the top search bar, type this exact address and press Enter: `http://localhost/phpmyadmin`
5. On the left side of the screen, click on **New** to create a new database.
6. In the "Database name" box, type exactly: `Biomedical` and click the **Create** button.
7. Click on your new `Biomedical` database from the list on the left so it is selected.
8. Look at the top menu bar and click on the **Import** tab.
9. Click the **Choose File** button. A window will open—go to your project folder and select the file named `Biomeidcal.sql`.
10. Scroll to the very bottom of the page and click the **Import** (or **Go**) button.
11. **(Optional but recommended)** To add our test data, repeat steps 8, 9, and 10, but this time choose the file named `seed_data.sql`.

---

## ⚙️ Step 2: Start the Hidden Server (Backend)

Now we need to start the engine that connects the website to the database.

1. Open the application **Visual Studio Code (VS Code)**.
2. Go to `File` > `Open Folder...` (at the top left) and select the whole project folder.
3. Look at the top menu in VS Code, click on **Terminal**, then click **New Terminal**. 
*(A black box will open at the bottom of the screen).*
4. Click inside that black box, type the following command exactly, and press **Enter**:
   ```bash
   npm install
   ```
   *(Wait a few seconds for it to finish loading files).*
5. When it finishes, type this next command and press **Enter**:
   ```bash
   node server.js
   ```
6. If everything is correct, you will see two messages in the black box:
   - `Server running at http://localhost:3000`
   - `Connected to MySQL Database successfuly.`

**🛑 CRITICAL:** Do not close VS Code or this black box! If you close it, the website will not be able to get data. Leave it running in the background.

---

## 🌐 Step 3: Open the Website!

1. Open the project folder normally in your computer's File Explorer (where your files are).
2. Find the file named `Test_4.html` and **double-click** it. 
3. It will open in your web browser. 
4. Congratulations! The website is working. Click on the words (Authors, Research, Journals, Publishers) at the top of the site to see the data load instantly.

---

### 💡 Troubleshooting (If something goes wrong):
- **Website doesn't show data?** Check if you closed the black Terminal box in VS Code. You must run `node server.js` for it to work.
- **Still have database issues?** Make sure XAMPP is open and both Apache and MySQL are glowing green.
