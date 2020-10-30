@isTest
private class SwagFormTest {
    @isTest
    private static void equalsSameInstance() {
        SwagForm form1 = SwagForm.getExample();
        SwagForm form2 = form1;
        SwagForm form3 = new SwagForm();
        SwagForm form4 = form3;

        System.assert(form1.equals(form2));
        System.assert(form2.equals(form1));
        System.assert(form1.equals(form1));
        System.assert(form3.equals(form4));
        System.assert(form4.equals(form3));
        System.assert(form3.equals(form3));
    }

    @isTest
    private static void equalsIdenticalInstance() {
        SwagForm form1 = SwagForm.getExample();
        SwagForm form2 = SwagForm.getExample();
        SwagForm form3 = new SwagForm();
        SwagForm form4 = new SwagForm();

        System.assert(form1.equals(form2));
        System.assert(form2.equals(form1));
        System.assert(form3.equals(form4));
        System.assert(form4.equals(form3));
    }

    @isTest
    private static void notEqualsDifferentType() {
        SwagForm form1 = SwagForm.getExample();
        SwagForm form2 = new SwagForm();

        System.assertEquals(false, form1.equals('foo'));
        System.assertEquals(false, form2.equals('foo'));
    }

    @isTest
    private static void notEqualsNull() {
        SwagForm form1 = SwagForm.getExample();
        SwagForm form2 = new SwagForm();
        SwagForm form3;

        System.assertEquals(false, form1.equals(form3));
        System.assertEquals(false, form2.equals(form3));
    }

    @isTest
    private static void consistentHashCodeValue() {
        SwagForm form1 = SwagForm.getExample();
        SwagForm form2 = new SwagForm();

        System.assertEquals(form1.hashCode(), form1.hashCode());
        System.assertEquals(form2.hashCode(), form2.hashCode());
    }

    @isTest
    private static void equalInstancesHaveSameHashCode() {
        SwagForm form1 = SwagForm.getExample();
        SwagForm form2 = SwagForm.getExample();
        SwagForm form3 = new SwagForm();
        SwagForm form4 = new SwagForm();

        System.assert(form1.equals(form2));
        System.assert(form3.equals(form4));
        System.assertEquals(form1.hashCode(), form2.hashCode());
        System.assertEquals(form3.hashCode(), form4.hashCode());
    }

    @isTest
    private static void maintainRenamedProperties() {
        SwagForm form = new SwagForm();
        Map<String, String> propertyMappings = form.getPropertyMappings();
        System.assertEquals('priceName', propertyMappings.get('price_name'));
        System.assertEquals('priceId', propertyMappings.get('price_id'));
    }
}
