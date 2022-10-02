const fs = require('fs');
const path = require('path');

const isDirectory = async (p, n) => {
    const stat = await fs.promise.stat(p + '/' + n);
    const res = await stat.isDirectory();
    return res;
}

const searchJs = dirPath => {
    let res = [];
    try {
        const children = fs.readdirSync(dirPath);
        children.forEach(file => {
            const fullPath = dirPath + '/' + file;
            const isDir = fs.lstatSync(fullPath).isDirectory();
            if(isDir) {
                res = res.concat(searchJs(fullPath));
            } else if (path.extname(fullPath) == '.js') {
                res.push(fullPath);
            }
        })
    } catch(err) {
        console.error(err);
    }
    return res;
}

res = searchJs('test');

for(const e of res)
    console.log(e);
