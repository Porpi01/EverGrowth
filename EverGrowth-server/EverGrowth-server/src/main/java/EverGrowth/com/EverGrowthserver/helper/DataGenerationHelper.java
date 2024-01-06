package EverGrowth.com.EverGrowthserver.helper;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public class DataGenerationHelper {

  private static final String[] aNames = {
      "Alejandro", "Sofía", "Mateo", "Valentina", "Javier", "Emma", "Pablo", "Isabella", "Diego", "Lucía",
      "Adrián", "Camila", "Carlos", "Valeria", "Martín", "Gabriela", "Julián", "María", "Tomás", "Elena",
      "Luis", "Ana", "Andrés", "Catalina", "Juan", "Laura", "Santiago", "Clara", "Emilio", "Paula"
  };

  private static final String[] aSurnames = {
      "García", "Rodríguez", "López", "Martínez", "Hernández", "Pérez", "González", "Sánchez", "Ramírez", "Torres",
      "Flores", "Díaz", "Gómez", "Vázquez", "Rojas", "Ruiz", "Serrano", "Blanco", "Molina", "Suárez",
      "Castillo", "Jiménez", "Ortega", "Delgado", "Cruz", "Ramos", "Alvarez", "Morales", "Santos", "Reyes"
  };

  public static String getRandomName() {
    return aNames[(int) (Math.random() * aNames.length)];
  }

  public static String getRandomSurname() {
    return aSurnames[(int) (Math.random() * aSurnames.length)];
  }

  public static String doNormalizeString(String cadena) {
    String original = "áàäéèëíìïóòöúùuñÁÀÄÉÈËÍÌÏÓÒÖÚÙÜÑçÇ";
    String ascii = "aaaeeeiiiooouuunAAAEEEIIIOOOUUUNcC";
    String cadenaSinAcentos = cadena;
    for (int i = 0; i < original.length(); i++) {
      cadenaSinAcentos = cadenaSinAcentos.replace(original.charAt(i), ascii.charAt(i));
    }
    return cadenaSinAcentos;
  }

  private static final String[] streetNames = {
      "Avenida de la Constitución", "Calle del Arenal", "Carrera de San Jerónimo", "Paseo de Recoletos",
      "Calle Fuencarral", "Avenida Gran Vía de Colón", "Paseo de la Independencia", "Calle del Príncipe",
      "Paseo de la Explanada de España", "Calle de la Princesa", "Avenida Menéndez Pelayo", "Calle de la Paz",
      "Paseo de la Alameda", "Avenida de la Libertad", "Calle del Marqués de Larios", "Calle del Prado",
      "Paseo de la Habana", "Avenida de la Victoria", "Calle Real", "Paseo de la Estación"

  };

  private static final String[] cities = {
      "Álava", "Albacete", "Alicante", "Almería", "Ávila", "Badajoz", "Islas Baleares", "Barcelona", "Burgos",
      "Cáceres", "Cádiz", "Castellón", "Ciudad Real", "Córdoba", "Coruña", "Cuenca", "Girona", "Granada", "Guadalajara",
      "Gipuzkoa", "Huelva", "Huesca", "Jaén", "León", "Lleida", "La Rioja", "Lugo", "Madrid", "Málaga", "Murcia",
      "Navarra",
      "Ourense", "Asturias", "Palencia", "Las Palmas", "Pontevedra", "Salamanca", "S.C.Tenerife", "Cantabria",
      "Segovia",
      "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia", "Valladolid", "Bizkaia", "Zamora", "Zaragoza",
      "Ceuta",
      "Melilla"
  };

  private static final String[] postalCodes = {
      "01001", "02001", "03001", "04001", "05001", "06001", "07001", "08001", "09001", "10001", "11001", "12001",
      "13001", "14001", "15001", "16001", "17001", "18001", "19001", "20001", "21001", "22001", "23001", "24001",
      "25001",
      "26001", "27001", "28001", "29001", "30001", "31001", "32001", "33001", "34001", "35001", "36001", "37001",
      "38001",
      "39001", "40001", "41001", "42001", "43001", "44001", "45001", "46001", "47001", "48001", "49001", "50001",
      "51001",
      "52001"
  };

  public static String generateRandomAddress() {
    Random rand = new Random();
    String street = streetNames[rand.nextInt(streetNames.length)];
    String city = cities[rand.nextInt(cities.length)];
    String postalCode = getPostalCodeForCity(city);

    return street + "," + city + "," + postalCode;
  }

  private static String getPostalCodeForCity(String city) {
    String[] cityArray = cities;
    String[] postalCodeArray = postalCodes;

    for (int i = 0; i < cityArray.length; i++) {
      if (cityArray[i].equals(city)) {
        return postalCodeArray[i];
      }
    }
    return "00000";
  }

  public static int getRandomInt(int min, int max) {
    Random rand = new Random();
    int randomNum = rand.nextInt((max - min) + 1) + min;
    return randomNum;
  }

  public static LocalDateTime getRadomDate() {
    long minDay = LocalDate.of(2024, 1, 1).toEpochDay();
    long maxDay = LocalDate.of(2026, 12, 31).toEpochDay();
    long randomDay = ThreadLocalRandom.current().nextLong(minDay, maxDay);
    return LocalDate.ofEpochDay(randomDay).atTime(getRandomInt(0, 23), getRandomInt(0, 59), getRandomInt(0, 59));

  }

  private static final String[] nombresProducto = {
      "Agua mineral", "Coca cola", "Fanta de naranja", "Aquarius", "Tónica", "Nestea",
      "Aceitunas rellenas de anchoa",
      "Aceitunas picadedos", "Arroz redondo", "Arroz basmati aromático", "Arroz integral redondo", "Garbanzo cocido",
      "Fideo Cabello de Ángel",
      "Fideuá", "Pajaritas vegetales", "Macarrón fino", "Chocolate negro 72% de cacao",
      "Chocolate puro Valor con almendras enteras"
  };

  private static final String[] categoriaProducto = {
      "Agua", "Bebidas", "Bebidas", "Bebidas", "Bebidas", "Bebidas", "Conservas",
      "Conservas", "Arroz",
      "Arroz", "Arroz", "Legumbres", "Pasta", "Pasta", "Pasta", "Pasta", "Repostería", "Repostería"
  };

  private static String getCategoria(String producto) {
    for (int i = 0; i < nombresProducto.length; i++) {
      if (nombresProducto[i].equals(producto)) {
        return categoriaProducto[i];
      }
    }
    return "No existe la categoría";
  }

  public static String getRandomProducto() {
    Random rand = new Random();
    int index = rand.nextInt(nombresProducto.length);
    return nombresProducto[index];
  }

  public static String asociarCategoria() {
    String randomProducto = getRandomProducto();
    return getCategoria(randomProducto);
  }

  private static final Random random = new Random();

  public static int generateRandomStock() {
    return random.nextInt(100);
  }

  public static float generateRandomPrecio() {
    return 5 + random.nextFloat() * (100 - 5);
  }

  private static final String[] nombresCategoria = {
      "Carnes", "Lácteos", "Frutas y Verduras", "Bebidas", "Congelados", "Enlatados", "Cereales", "Pescado y Marisco",
      "Panadería", "Repostería",
      "Arroz", "Legumbres", "Pasta", "Conservas"
  };

  public static String getRandomCategoria() {
    return nombresCategoria[(int) (Math.random() * nombresCategoria.length)];
  }
}