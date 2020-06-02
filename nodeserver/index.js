const path = require('path');
const express = require('express');
const morgan = require('morgan');
const app = express();

// settings
app.set('port', process.env.PORT || 3000);

// middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

// routes
app.use('/subtemplate', require('./routes/subtemplate'));
app.use('/data', require('./routes/data'));

// static files
app.use(express.static(path.join(__dirname, '../src/main')));
app.use("/node_modules", express.static(path.join(__dirname, '../node_modules')));
app.use("/js", express.static(path.join(__dirname, '../dist')));


// start the server
app.listen(app.get('port'), () => {
  console.log(`server on port ${app.get('port')}`);
});
