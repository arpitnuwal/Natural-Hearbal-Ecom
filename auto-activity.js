const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");
const readline = require("readline");

const rl = readline.createInterface({
input: process.stdin,
output: process.stdout
});

// Commit messages
const messages = [
"feat: add new feature",
"fix: resolve issue",
"docs: update docs",
"refactor: improve code",
"style: formatting",
"perf: optimize performance",
"test: add tests",
"chore: cleanup"
];

// Tasks
const tasks = [
"Improve UI",
"Fix auth bug",
"Optimize API",
"Refactor logic",
"Add validation",
"Update README",
"Enhance UX"
];

// Issue titles
const issues = [
"Bug in login",
"UI glitch",
"API slow response",
"Feature request",
"Crash on submit",
"Improve performance",
"Security issue"
];

// Issue bodies
const issueBodies = [
"Steps to reproduce:\n1. Open app\n2. Click action\n3. Error occurs",
"Expected behavior:\nApplication should work smoothly",
"Actual result:\nUnexpected crash observed",
"Enhancement needed for better UX",
"Performance improvement required",
];

// Helpers
function randomItem(arr) {
return arr[Math.floor(Math.random() * arr.length)];
}

function sleep(ms) {
return new Promise(resolve => setTimeout(resolve, ms));
}

function getRandomDateTime(baseDate) {
const date = new Date(baseDate);
date.setHours(
Math.floor(Math.random() * 24),
Math.floor(Math.random() * 60),
Math.floor(Math.random() * 60)
);
return date.toISOString();
}

function ask(question, def) {
return new Promise(resolve => {
rl.question(`${question} (default ${def}): `, ans => {
resolve(ans.trim() || def);
});
});
}

// Ensure git repo
function ensureGitRepo(repoPath) {
if (!fs.existsSync(path.join(repoPath, ".git"))) {
console.log("⚠️ Not a git repo → initializing...");
execSync("git init", { cwd: repoPath, stdio: "inherit" });
}
}

// Commit
function makeCommit(repoPath, useEmptyCommit, date) {
const message = randomItem(messages);
const commitDate = getRandomDateTime(date);

console.log(`📝 ${message} | 📅 ${commitDate}`);

if (!useEmptyCommit) {
    const file = path.join(repoPath, "activity.txt");
    const content = `✔ ${randomItem(tasks)} - ${new Date().toISOString()}\n`;

    fs.appendFileSync(file, content);
    execSync("git add .", { cwd: repoPath, stdio: "inherit" });
}

execSync(
    `git commit ${useEmptyCommit ? "--allow-empty" : ""} --date="${commitDate}" -m "${message}"`,
    { cwd: repoPath, stdio: "inherit" }
);


}

// Create unique issue
function createIssue(repoPath) {
try {
const baseTitle = randomItem(issues);
const body = randomItem(issueBodies);


    const uniqueId = Date.now() + "-" + Math.floor(Math.random() * 1000);
    const title = `${baseTitle} (#${uniqueId})`;

    console.log(`🐞 Creating issue: ${title}`);

    execSync(`gh issue create -t "${title}" -b "${body}"`, {
        cwd: repoPath,
        stdio: "inherit"
    });

} catch (err) {
    console.log("⚠️ Issue skipped (gh problem)");
}


}

// Close random issue
function closeIssue(repoPath) {
try {
const output = execSync(`gh issue list --state open --limit 10 --json number`, {
cwd: repoPath
}).toString();


    const issueList = JSON.parse(output);
    if (issueList.length === 0) return;

    const issue = randomItem(issueList);

    console.log(`✅ Closing issue #${issue.number}`);

    execSync(`gh issue close ${issue.number}`, {
        cwd: repoPath,
        stdio: "inherit"
    });

} catch (err) {
    console.log("⚠️ No issues to close");
}


}

// Date range
function getDateRange(startDate, endDate) {
const dates = [];
let current = new Date(startDate);
const last = new Date(endDate);


while (current <= last) {
    dates.push(new Date(current));
    current.setDate(current.getDate() + 1);
}

return dates;


}

// MAIN
async function main() {
console.log("=".repeat(50));
console.log("🚀 Auto GitHub Activity PRO");
console.log("=".repeat(50));

const repoPath = await ask("Repo path", ".");
const startDate = await ask("Start date (YYYY-MM-DD)", "2025-01-01");
const endDate = await ask("End date (YYYY-MM-DD)", "2025-01-10");
const useEmpty = (await ask("Empty commits? (yes/no)", "no")) === "yes";

ensureGitRepo(repoPath);

const dates = getDateRange(startDate, endDate);

console.log("\n⚡ Generating activity...\n");

for (let d of dates) {
    const day = new Date(d).getDay();

    // Weekend low activity
    const commitsToday = (day === 0 || day === 6)
        ? Math.floor(Math.random() * 1) + 1
        : Math.floor(Math.random() * 2) + 1;

    console.log(`📅 ${d.toISOString().split("T")[0]} → ${commitsToday} commits`);

    for (let i = 0; i < commitsToday; i++) {
        makeCommit(repoPath, useEmpty, d);

        // 50% chance issue create
        if (Math.random() > 0.5) {
            createIssue(repoPath);
        }

        // 30% chance close
        if (Math.random() > 0.7) {
            closeIssue(repoPath);
        }

        await sleep(Math.floor(Math.random() * 2000) + 1000);
    }
}

console.log("\n🚀 Pushing...");
execSync("git push", { cwd: repoPath, stdio: "inherit" });

console.log("✅ Done! Check GitHub graph 😎");

rl.close();


}

main();
