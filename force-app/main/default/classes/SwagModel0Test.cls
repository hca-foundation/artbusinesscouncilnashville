@isTest
private class SwagModel0Test {
    @isTest
    private static void equalsSameInstance() {
        SwagModel0 model01 = SwagModel0.getExample();
        SwagModel0 model02 = model01;
        SwagModel0 model03 = new SwagModel0();
        SwagModel0 model04 = model03;

        System.assert(model01.equals(model02));
        System.assert(model02.equals(model01));
        System.assert(model01.equals(model01));
        System.assert(model03.equals(model04));
        System.assert(model04.equals(model03));
        System.assert(model03.equals(model03));
    }

    @isTest
    private static void equalsIdenticalInstance() {
        SwagModel0 model01 = SwagModel0.getExample();
        SwagModel0 model02 = SwagModel0.getExample();
        SwagModel0 model03 = new SwagModel0();
        SwagModel0 model04 = new SwagModel0();

        System.assert(model01.equals(model02));
        System.assert(model02.equals(model01));
        System.assert(model03.equals(model04));
        System.assert(model04.equals(model03));
    }

    @isTest
    private static void notEqualsDifferentType() {
        SwagModel0 model01 = SwagModel0.getExample();
        SwagModel0 model02 = new SwagModel0();

        System.assertEquals(false, model01.equals('foo'));
        System.assertEquals(false, model02.equals('foo'));
    }

    @isTest
    private static void notEqualsNull() {
        SwagModel0 model01 = SwagModel0.getExample();
        SwagModel0 model02 = new SwagModel0();
        SwagModel0 model03;

        System.assertEquals(false, model01.equals(model03));
        System.assertEquals(false, model02.equals(model03));
    }

    @isTest
    private static void consistentHashCodeValue() {
        SwagModel0 model01 = SwagModel0.getExample();
        SwagModel0 model02 = new SwagModel0();

        System.assertEquals(model01.hashCode(), model01.hashCode());
        System.assertEquals(model02.hashCode(), model02.hashCode());
    }

    @isTest
    private static void equalInstancesHaveSameHashCode() {
        SwagModel0 model01 = SwagModel0.getExample();
        SwagModel0 model02 = SwagModel0.getExample();
        SwagModel0 model03 = new SwagModel0();
        SwagModel0 model04 = new SwagModel0();

        System.assert(model01.equals(model02));
        System.assert(model03.equals(model04));
        System.assertEquals(model01.hashCode(), model02.hashCode());
        System.assertEquals(model03.hashCode(), model04.hashCode());
    }

    @isTest
    private static void maintainRenamedProperties() {
        SwagModel0 model0 = new SwagModel0();
        Map<String, String> propertyMappings = model0.getPropertyMappings();
        System.assertEquals('requestSpeed', propertyMappings.get('request_speed'));
    }

    @isTest
    private static void defaultValuesPopulated() {
        SwagModel0 model0 = new SwagModel0();
        System.assertEquals(new List<SwagDonations>(), model0.donations);
        System.assertEquals(null, model0.requestSpeed);
    }
}