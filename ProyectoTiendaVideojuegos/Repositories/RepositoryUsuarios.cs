using ProyectoTiendaVideojuegos.Data;
using ProyectoTiendaVideojuegos.Helpers;
using ProyectoTiendaVideojuegos.Models;

namespace ProyectoTiendaVideojuegos.Repositories
{
    public class RepositoryUsuarios
    {
        private UsuariosContext context;

        public RepositoryUsuarios(UsuariosContext context)
        {
            this.context = context;
        }
        private int GetMaxIdUsuario()
        {
            if (this.context.Clientes.Count() == 0)
            {
                return 1;
            }
            else
            {
                return this.context.Clientes.Max(z => z.IdCliente) + 1;
            }
        }

        public async Task RegisterUsuario(string nombre, string apellidos,string email, string password, string imagen)
        {
            Cliente user = new Cliente();
            user.IdCliente = this.GetMaxIdUsuario();
            user.Nombre = nombre;
            user.Apellidos = apellidos;
            user.Email = email;
            user.Imagen = imagen;
            user.Salt = HelperCryptography.GenerateSalt();
            user.Contraseña = HelperCryptography.EncryptPassword(password, user.Salt);
            this.context.Clientes.Add(user);
            await this.context.SaveChangesAsync();
        }

        public Cliente LoginUser(string email, string password)
        {
            Cliente user = this.context.Clientes.FirstOrDefault(z => z.Email == email);
            if (user == null)
            {
                return null;
            }
            else
            {
                byte[] passUsuario = user.Contraseña;
                string salt = user.Salt;
                byte[] temp = HelperCryptography.EncryptPassword(password, salt);
                bool respuesta = HelperCryptography.CompareArrays(passUsuario, temp);
                if (respuesta == true)
                {
                    return user;
                }
                else
                {
                    return null;
                }
            }
        }
    }
}
