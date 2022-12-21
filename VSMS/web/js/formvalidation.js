
//This is for Menu.jsp Form
//Parameter includes dish_name, dish_description


$('#addIngredient')
  .form({
    on: 'blur',
    fields: {
      dish_name: {
        identifier  : 'dish_name',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter a value'
          }
        ]
      },
      dish_description: {
        identifier  : 'dish_description',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter a value'
          }
        ]
      }
    }
  })
;
