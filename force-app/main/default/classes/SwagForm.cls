/*
 * GiveWP
 * GiveWP Donation API
 *
 * OpenAPI spec version: 0.1
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */

/**
 * SwagForm
 */
public class SwagForm implements Swagger.MappedProperties {
    /**
     * Get id
     * @return id
     */
    public Integer id { get; set; }

    /**
     * Get name
     * @return name
     */
    public String name { get; set; }

    /**
     * Get price
     * @return price
     */
    public Double price { get; set; }

    /**
     * Get priceName
     * @return priceName
     */
    public String priceName { get; set; }

    /**
     * Get priceId
     * @return priceId
     */
    public String priceId { get; set; }

    private static final Map<String, String> propertyMappings = new Map<String, String>{
        'price_name' => 'priceName',
        'price_id' => 'priceId'
    };

    public Map<String, String> getPropertyMappings() {
        return propertyMappings;
    }

    public static SwagForm getExample() {
        SwagForm form = new SwagForm();
          form.id = 0;
          form.name = '';
          form.price = 1.3579;
          form.priceName = '';
          form.priceId = '';
        return form;
    }

    public Boolean equals(Object obj) {
        if (obj instanceof SwagForm) {           
            SwagForm form = (SwagForm) obj;
            return this.id == form.id
                && this.name == form.name
                && this.price == form.price
                && this.priceName == form.priceName
                && this.priceId == form.priceId;
        }
        return false;
    }

    public Integer hashCode() {
        Integer hashCode = 43;
        hashCode = (17 * hashCode) + (id == null ? 0 : System.hashCode(id));
        hashCode = (17 * hashCode) + (name == null ? 0 : System.hashCode(name));
        hashCode = (17 * hashCode) + (price == null ? 0 : System.hashCode(price));
        hashCode = (17 * hashCode) + (priceName == null ? 0 : System.hashCode(priceName));
        hashCode = (17 * hashCode) + (priceId == null ? 0 : System.hashCode(priceId));
        return hashCode;
    }
}
