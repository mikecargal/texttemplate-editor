const express = require('express');
const router = express.Router();

const subtemplates = require('../data.json');

router.get('/:name', (req, res) => {
	const { name } = req.params 
	if (subtemplates[name]){
		res.send(subtemplates[name]);
	} else {
		res.json({"error": 'Subtemplate ' + name + ' not found'})
	}
});

router.post('/', (req, res) => {
  console.log(req.body);
  const { name } = req.body;
  subtemplates.push({
    id: subtemplates.length + 1,
    name
  });
  res.json('Successfully created');
});

router.put('/:id', (req, res) => {
  console.log(req.body, req.params)
  const { id } = req.params;
  const { name } = req.body;

  subtemplates.forEach((product, i) => {
    if (product.id == id) {
      subtemplates.name = name;
    }
  });
  res.json('Successfully updated');

});

router.delete('/:id', (req, res) => {
  const { id } = req.params;

  subtemplates.forEach((product, i) => {
    if(subtemplates.id == id) {
      subtemplates.splice(i, 1);
    }
  });
  res.json('Successfully deleted');
});

module.exports = router;