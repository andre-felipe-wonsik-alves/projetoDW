package Entidades;

import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2023-10-13T12:06:12", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> nick;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, Integer> role;
    public static volatile SingularAttribute<User, String> email;

}