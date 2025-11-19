# LaptopShop - E-Commerce Web Application

A laptop e-commerce web application built with **Spring Boot 3**, **Spring MVC**, **Spring Security**, **JPA/Hibernate**, and **JSP**.

## 🚀 Features

### Client Features

- 🔐 User registration, login, and logout
- 🛍️ Product listing with advanced filtering:
  - Filter by manufacturer (Apple, Asus, Lenovo, Dell, LG, Acer)
  - Filter by target audience (Gaming, Office, Graphics, Student)
  - Filter by price range (Under 10M, 10-15M, 15-20M, Over 20M VND)
  - Sort by price (Ascending, Descending, No sort)
- 🔍 Product search by name
- 📄 Product detail view
- 🛒 Add to cart with AJAX (no page reload)
- 💳 Cart management (view, update quantity, remove items)
- 📦 Checkout and order history
- 👤 User profile management

### Admin Features

- 📊 Dashboard overview
- 👥 User management (CRUD)
- 📦 Product management (CRUD) with image upload
- 🧾 Order management (view, update status)

## 🛠️ Tech Stack

### Backend

- **Spring Boot 3.5.6** - Main framework
- **Spring MVC** - Web application framework
- **Spring Security** - Authentication and authorization
- **Spring Data JPA** - Database queries
- **Hibernate** - ORM framework
- **Spring Session JDBC** - Session management
- **MySQL** - Database
- **Maven** - Dependency management

### Frontend

- **JSP** - View template engine
- **JSTL** - JSP Standard Tag Library
- **Bootstrap 5** - CSS framework
- **jQuery 3.6.4** - JavaScript library
- **AJAX** - Asynchronous API calls

### Others

- **Hibernate JPA Model Generator** - Generate metamodel classes
- **Bean Validation** - Data validation
- **Spring DevTools** - Hot reload in development

## 📋 Requirements

- **Java**: JDK 21 or higher
- **MySQL**: 8.0 or higher
- **Maven**: 3.6+ (or use included Maven wrapper)

## 🔧 Installation & Setup

### 1. Clone repository

### 1. Clone repository

```bash
git clone https://github.com/vvm1004/java-spring-mvc.git
cd LaptopShop
```

### 2. Configure database

Create MySQL database:

```sql
CREATE DATABASE laptopshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Update connection info in `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/laptopshop
spring.datasource.username=root
spring.datasource.password=your_password
```

### 3. Run application

**Windows:**

```bash
.\mvnw.cmd spring-boot:run
```

**Linux/Mac:**

```bash
./mvnw spring-boot:run
```

Or use your IDE (IntelliJ IDEA, Eclipse, VS Code) to run `LaptopshopApplication.java`

### 4. Access application

- **Homepage**: http://localhost:3000
- **Admin**: http://localhost:3000/admin

### 5. Default accounts

The application automatically creates 2 accounts on first startup:

**Admin:**

- Email: `admin@gmail.com`
- Password: `123456`

**User:**

- Email: `vvm1004@gmail.com`
- Password: `123456`

## 📁 Project Structure

## 📁 Project Structure

```
src/main/
├── java/vn/vvm1004/laptopshop/
│   ├── config/              # Spring Security, Web MVC configuration
│   ├── controller/
│   │   ├── admin/          # Admin panel controllers
│   │   └── client/         # Client controllers
│   ├── domain/             # JPA Entities
│   │   └── dto/           # Data Transfer Objects
│   ├── repository/         # Spring Data JPA Repositories
│   └── service/            # Business logic
│       ├── specification/ # JPA Specifications for dynamic queries
│       └── validator/     # Custom validators
├── resources/
│   ├── application.properties  # Application configuration
│   └── static/                # Static CSS, JS
└── webapp/WEB-INF/
    ├── resources/             # Static resources (CSS, JS, images)
    │   ├── client/           # Client assets
    │   ├── css/              # Admin CSS
    │   └── js/               # Admin JavaScript
    └── view/                  # JSP templates
        ├── admin/            # Admin views
        └── client/           # Client views
```

## 🔑 Key Features

### 1. Advanced Product Filtering

- Uses **Spring Data JPA Specifications** for dynamic queries
- Combines **AND** logic (between different criteria) and **OR** logic (within same criteria)
- Preserves checkbox states after filtering

### 2. AJAX Add to Cart

- Add products to cart without page reload
- Real-time cart count updates
- Bootstrap Toast notifications for success/error feedback

### 3. Session Management

- Uses **Spring Session JDBC** to store sessions in database
- Session timeout: 30 minutes
- Supports horizontal scaling

### 4. Security

- Password encryption with **BCrypt**
- Role-based authorization (ADMIN, USER)
- CSRF protection
- Remember-me functionality

### 5. File Upload

- Product image and avatar upload
- File size validation (max 50MB)
- Storage in `uploads/` directory

## 🎨 Screenshots

### Client

- Homepage with product listing
- Multi-criteria filtering
- Product details
- Shopping cart
- Order history

### Admin

- Dashboard statistics
- User management
- Product management
- Order management

## 🧪 Testing

Run tests:

```bash
.\mvnw.cmd test
```

## 📝 API Endpoints

### Client APIs

- `GET /` - Homepage
- `GET /products` - Product listing with filters
- `GET /product/{id}` - Product details
- `POST /add-product-to-cart/{id}` - Add to cart (form submit)
- `POST /api/add-product-to-cart/{id}` - Add to cart (AJAX)
- `GET /cart` - View cart
- `POST /delete-cart-product/{id}` - Remove product from cart
- `POST /confirm-checkout` - Confirm order
- `GET /order-history` - Order history

### Admin APIs

- `GET /admin` - Dashboard
- `GET /admin/user` - User list
- `GET /admin/user/create` - User creation form
- `POST /admin/user/create` - Create new user
- `GET /admin/user/update/{id}` - User update form
- `POST /admin/user/update` - Update user
- `POST /admin/user/delete/{id}` - Delete user
- `GET /admin/product` - Product list
- `GET /admin/product/create` - Product creation form
- `POST /admin/product/create` - Create new product
- `GET /admin/product/{id}` - Product details
- `GET /admin/product/update/{id}` - Product update form
- `POST /admin/product/update` - Update product
- `POST /admin/product/delete/{id}` - Delete product
- `GET /admin/order` - Order list
- `GET /admin/order/{id}` - Order details
- `POST /admin/order/update/{id}` - Update order

## 🐛 Troubleshooting

### Database connection error

Check:

- MySQL is running
- Connection info in `application.properties` is correct
- Database `laptopshop` has been created

### NotSerializableException error

Ensure entity classes implement `Serializable`:

```java
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    // ...
}
```

### 404 error when accessing JSP

Check:

- JSP files are in `src/main/webapp/WEB-INF/view/`
- Maven has built resources correctly

## 📚 References

- [Spring Boot Documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/)
- [Spring Security Reference](https://docs.spring.io/spring-security/reference/)
- [Spring Data JPA Documentation](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/)

## 📄 License

This project is released under the MIT License.

---
