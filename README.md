# Rails Girl 2019

<details><summary><h2>0. Prepare your development environbment</h2></summary>

Before you get start, please make sure your laptop is ready for the workshop. Typically, you'll need those applications:

- Text editor (heavily personal preference, for example VSCode, Atom, etc.)
- Web Browser (Chrome, Safari, Firefox, etc.)
- Terminal
- Docker
- Git

</details>

<details><summary><h2>1. Getting Started</h2></summary>

To make things easier for you to setup the development environment, we already prepare a developmet kit, and all the following commands are based on this template. If you want to setup the development environment by yourself from scratch, read the Go Extra Miles sections. You'll need to make a copy of this kit in your computer,

- Open the terminal in your computer
- Run this command in your terminal:

```bash
git clone git@github.com:nguyenquangminh0711/rails-girl-demo.git
```

- Change the working directory to the kit:

```bash
cd rails-girl-demo
```

- Start the web server with this command:

+ On Windows

```bash
./start_server.bat
```

+ On Linux/MacOS

```bash
./start_server.sh
```

- The web server is started at [http://localhost:4000](http://localhost:4000). Open this link, and if you can see this, congratulation, you started your first web server.

![Getting started server](guides/1-server-start.png)

- To stop the web server, in your recent terminal window, press `Ctrl` and `C`.
</details>

<details><summary><h2>2. Create a static product listing page</h2></summary>

In this section, you'll be able to create a page to show a list of products. A typical product shown on the home page needs some information:

- Name, for example "iPhone XS Max 64GB"
- Brand, for example "Apple"
- Price, for example, "29,000,000"
- Product image, for example: [iPhone XS Max image from FPT Shop](https://cdn.fptshop.com.vn/Uploads/Originals/2018/10/11/636748771945393060_iPhone-Xs-Max-gold.png)

Let's create the first page to show the above product.

- Start another terminal window
- Run this command

+ On Windows

```bash
./start_console.bat
```

+ On Linux/MacOS

```bash
./start_console.sh
```

- Run this command:

```bash
rails generate controller Products index
```

You are using the scaffolding feature of Rails. If everything is correct, you'll see something like this:

![Rails scaffolding](./guides/2-rails-scaffold.png)

- Now, open the file `app/controllers/products_controller.rb`, you'll see something like this:

```ruby
class ProductsController < ApplicationController
  def index
  end
end
```

- Let's add the list of products you want to display to the `index` method of class `ProductsController`. You can add as many products you want. You can copy the image links from Google Images:

```ruby
class ProductsController < ApplicationController
  def index
    @products = [
      {
        name: 'Điện thoại iPhone XS Max 512GB',
        brand: 'Apple',
        price: 29000000,
        image: 'https://cdn.fptshop.com.vn/Uploads/Originals/2018/10/11/636748771945393060_iPhone-Xs-Max-gold.png'
      },
      {
        name: 'Tai nghe Bluetooth Airpod 2',
        brand: 'Apple',
        price: 4500000,
        image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/image/AppleInc/aos/published/images/M/RX/MRXJ2/MRXJ2?wid=1144&hei=1144&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1551489675083'
      },
      {
        name: 'Điện Thoại Samsung Galaxy S10',
        brand: 'Samsung',
        price: 16000000,
        image: 'https://cdn.fptshop.com.vn/Uploads/Originals/2019/2/21/636863643187455627_ss-galaxy-s10-trang-1.png'
      },
      {
        name: 'Tai nghe Beat Studio M8',
        brand: 'Apple',
        price: 7000000,
        image: 'https://ngheloa.com/wp-content/uploads/2017/12/headphone-beat-studio-ms-81118-chinh-hang-ngheloa.com-1.jpg'
      },
      {
        name: 'Máy tính bảng iPad Pro 11 inch Wifi 64GB',
        brand: 'Apple',
        price: 20000000,
        image: 'https://cdn.tgdd.vn/Products/Images/522/195067/ipad-pro-11-inch-2018-64gb-wifi-33397-thumb-600x600.jpg'
      },
    ]
  end
end
```

Let's add a list of 5 items. Please note that all items in the product list must have 4 fields: `name`, `brand`, `brand`, `price`.

- Edit the file `app/views/products/index.html.erb`. Replace the content with the follow scripts:

```erb
<% @products.each do |product| %>
  <%= render 'product', product: product %>
<% end %>
```

- Create new file `app/views/products/_product.html.erb`, with the following content:

```erb
<div class="product">
  <p>
    <img src="<%= product[:image] %>"/>
  </p>
  <b><%= product[:name] %></b>
  <p><%= product[:brand] %></p>
  <i><%= number_to_currency(product[:price], unit: 'đ', seperator: ',') %></i>
</div>
```

- To make the product listing page your home page, replace the content in `config/routes.rb` with:

```ruby
Rails.application.routes.draw do
  root 'products#index'
end
```

- Open [http://localhost:4000](http://localhost:4000). Tada, you have your first basic product page.

![Basic Product List Page](./guides/2-first-product-page.png)

- It doesn't look great right? Let's add some styling to this page to make it more attractive. We'll use [Bootstrap 4](https://getbootstrap.com), which is the most popular front-end framework. The library is already bundled in the development kit. You'll just need to modify and apply the HTML components into the product page.

- Update the file `app/views/products/index.html.erb` with:

```erb
<div class="products container">
  <div class="row">
    <% @products.each do |product| %>
      <%= render 'product', product: product %>
    <% end %>
  </div>
</div>
```

- Update the file `app/views/products/_product.html.erb` with:

```erb
<div class="product col-md-4 mb-3">
  <p>
    <img class="img-fluid img-thumbnail" src="<%= product[:image] %>"/>
  </p>
  <div class="product-brand mb-1"><%= product[:brand] %></div>
  <h5><%= product[:name] %></h5>
  <h5 class="product-price"><%= number_to_currency(product[:price], unit: 'đ', seperator: ',', format: "%n %u") %></h5>
</div>
```

- Update the file `app/assets/stylesheets/products.scss` with:

```css
.product-brand {
  color: #777;
}

.product-price {
  color: green;
}
```

- Refresh your website, you'll see something like this. Not bad huh?

![Product list new look](./guides/2-new-look.png)

</details>

<details><summary><h2>3. Use database to manage your products</h2></summary>

When the number of products grows, it's terrible to keep adding the products to the `ProductsController`. Let's use the database to store and manage your products.

- Generate models and schema migration with this command:

```bash
rails generate model Product name:text brand:text price:integer image:text
```

- Make the database schema change take effective with this command:

```bash
rake db:migrate
```

- We'll need some validations for the Product model to ensure the validity of data. Edit the file `app/models/product.rb`

```ruby
class Product < ApplicationRecord
  validates :name, presence: true, length: {in: 5..255}
  validates :brand, presence: true, length: {in: 5..100}
  validates :price, inclusion: 1..1000000000
  validates  :image, presence: true
end
```

- You'll need a list of seed products for your website. Copy the product list in `ProductsController`, and convert into following in the file `db/seeds.rb`

```ruby
Product.destroy_all
Product.create(
  name: 'Điện thoại iPhone XS Max 512GB',
  brand: 'Apple',
  price: 29000000,
  image: 'https://cdn.fptshop.com.vn/Uploads/Originals/2018/10/11/636748771945393060_iPhone-Xs-Max-gold.png'
)
Product.create!(
  name: 'Tai nghe Bluetooth Airpod 2',
  brand: 'Apple',
  price: 4500000,
  image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/image/AppleInc/aos/published/images/M/RX/MRXJ2/MRXJ2?wid=1144&hei=1144&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1551489675083'
)
Product.create!(
  name: 'Điện Thoại Samsung Galaxy S10',
  brand: 'Samsung',
  price: 16000000,
  image: 'https://cdn.fptshop.com.vn/Uploads/Originals/2019/2/21/636863643187455627_ss-galaxy-s10-trang-1.png'
)
Product.create!(
  name: 'Tai nghe Beat Studio M8',
  brand: 'Apple',
  price: 7000000,
  image: 'https://ngheloa.com/wp-content/uploads/2017/12/headphone-beat-studio-ms-81118-chinh-hang-ngheloa.com-1.jpg'
)
Product.create!(
  name: 'Máy tính bảng iPad Pro 11 inch Wifi 64GB',
  brand: 'Apple',
  price: 20000000,
  image: 'https://cdn.tgdd.vn/Products/Images/522/195067/ipad-pro-11-inch-2018-64gb-wifi-33397-thumb-600x600.jpg'
)
```

- Run this script to seed the product list into database:

```ruby
rake db:seed
```

- Update the file `app/controllers/products_controller.rb`, with:

```ruby
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
end
```

- Replace the hash access syntax to method calls in `app/views/products/_product.html.erb` with:

```ruby
<div class="product col-md-4 mb-3">
  <p>
    <img class="img-fluid img-thumbnail" src="<%= product.image %>"/>
  </p>
  <div class="d-flex justify-content-between">
    <div class="product-brand mb-1"><%= product.brand %></div>
    <div class="product-id mb-1">#<%= product.id %></div>
  </div>
  <h5><%= product.name %></h5>
  <h5 class="product-price"><%= number_to_currency(product.price, unit: 'đ', seperator: ',', format: "%n %u") %></h5>
</div>
```

- The number next to the brand is the product ID. Add some CSS styles to de-emphasize the product ID. Add to the file `app/assets/stylesheets/products.scss`:

```css
.product-id {
  color: #777;
}
```

- Now, open Rails console with the command:

```bash
rails c
```

- You can freely create a new product by copy & paste the commands into Rails console:

```ruby
Product.create!(
  name: 'name',
  brand: 'brand',
  price: 1000,
  image: 'image_url'
)
```

- You can also update a particular product information (for example ID 4), with the following commands in Rails console:

```ruby
product = Product.find(4)
product.update!(price: 8000000)
```

- And finally, you can delete a particular product (for example ID 3), with the following commands in Rials console:

```ruby
product = Product.find(3)
product.destroy!
```
</details>

<details><summary><h2>Deploy your application</h2></summary>
To deploy to the world, please follow the following step:

- Register an account in Heroku

![Register account](guides/register-account.png)

- Create your first app (ex: 'rails-girl-demo') in Heroku console

![Create app](guides/create-app-1.png)
![Create app](guides/create-app-2.png)

- Add Postgres Plugin

![Config Postgres](guides/config-postgres-1.png)
![Config Postgres](guides/config-postgres-2.png)
![Config Postgres](guides/config-postgres-3.png)
![Config Postgres](guides/config-postgres-4.png)

- Run `heroku login`
- Run `heroku container:login`
- Run `heroku container:push web --app <<APP NAME>>`
- Run `heroku container:release web --app <<APP NAME>>`

Click on "Open app", and enjoy

![Open application](guides/open-app.png)

To re-deploy, please follow the following step:
- Run `heroku container:push web --app <<APP NAME>>`
- Run `heroku container:release web --app <<APP NAME>>`
</details>
